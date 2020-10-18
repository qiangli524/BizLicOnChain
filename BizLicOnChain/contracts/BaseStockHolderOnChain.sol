pragma solidity ^0.6.0;

contract BaseStockHolderOnChain {
    /**
     * 股东
     */
    struct StockHolder{
        string uniScId;//统一社会信用码
        string investorName;//股东姓名
        address investorAccount;//股东账号
        string investorCetfHash;//身份证件信息
        string stockRightDetail;//股权详情
        bytes32 merkel;//默克尔值
        uint cptAmt;//出资额度
    }
    
    /*
     * 股权申请。（还处于流程中的股权）
     */
    struct StockRightApply{
        string uniScId;//统一社会信用码
		string transferorCetfHash;//出让方身份证件的Hash值
        string investorName;//新股东姓名
        uint price;//价格（以太币,wei）
        address investorAccount;//新股东账号
        string investorCetfHash;//新股东身份证件信息
        string stockRightDetail;//股权详情
        bytes32 merkel;//默克尔值（新股东姓名、新股东身份证件、转让份额三者加起来的默克尔值）
        uint cptAmt;//转让额度
        string isSuccess;//是否交易成功
        string status;//状态 “开始”、“待董事会确认”，“待付款”，“发证机关备案”，“结束”（成功或失败）。
    }
    
    address creator;
    
    /*
     * 所有的股东，其中key是组织机构代码，value是另外一个mapping。
     * value mapping 的结构如下：key是股东身份证件的Hash值，value是股东信息。
     */
    mapping(string => mapping(string => StockHolder)) stockHolders;
    
    /**
     * 股东编号的Map,其中key是组织机构代码.value是股东身份证件的Hash值
     */
    mapping(string => string[]) stockHoldersKeys;
    
    /**
     * 股权申请的Map，其中key是组织机构代码.
	 * value mapping 的结构如下：key是新股东的身份证件号，value申请信息。
     */
    mapping(string => mapping(string =>StockRightApply)) stockRightApplys;
	/**
	 * 申请案号的Map，其中key是组织机构代码.
	 */
	mapping(string => string[]) stockRightApplyKeys;
    
    /**
     * 市监局信息的管理合约地址
     */
    address aicOrganHolder;
    
    /**
     * 管理营业执照的合约地址
     */
    address bizLicContract;
    
    /**
     * 合约版本
     */
    address currentVersion;
    
     /**
     * 是否初始化
     */
    bool internal _initialized = false;
    
    function getAicOrganHolder() public view returns(address){
    	return aicOrganHolder;
    }

}
