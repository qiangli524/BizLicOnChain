pragma solidity ^0.5.0;

/**
 * 加解密函数
 */
library Encryptionutils {
     /**
      * 校验签名
      * orgContent: 原文
      * sign:签名
      * targetAdress: 公钥
      */
    function verificate(string memory orgContent,string memory sign,address targetAdress) public pure returns(bool) {
        //solidity 有4个取散列的方法：keccak256,sha3,sha256,ripemd160;其中ripemd160返回的是bytes20,不符合要求;sha3的算法与keccak256相同
        bytes memory signature = bytes(sign);
		bytes32 r = bytesToBytes32(slice(signature,0,64));
		bytes32 s = bytesToBytes32(slice(signature,64,64));
		uint8 v = bytesToUint(slice(signature,128,2))+26;
        address addr = ecrecover(keccak256(bytes(orgContent)),v,r,s);
        return addr==targetAdress;
    }
    
    function slice(bytes memory data,uint start,uint len) private pure returns(bytes memory){
        bytes memory b=new bytes(len);
        for(uint i=0;i<len;i++){
            b[i]=data[i+start];
        }
        return b;
    }
    
    function bytesToBytes32(bytes memory source) private pure returns(bytes32 result){
        assembly{
            result :=mload(add(source,32))
        }
    }
    
    function bytesToUint(bytes memory b) private pure returns (uint8){
	    uint8 number = 0;
	    for(uint i= 0; i<b.length; i++){
	        number = uint8(number + uint8(b[i])*(2**(8*(b.length-(i+1)))));
	    }
	    return number;
	}
}
