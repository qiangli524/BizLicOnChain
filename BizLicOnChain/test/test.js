var EncryptUtils = artifacts.require("EncryptUtils");

contract('EncryptUtils Test', function(accounts){
  it('测试验签', function(){
    return EncryptUtils.deployed().then(async function(instance){
    	let licContent = "{uniScId:'123100008654367537',corpName:'某某股份有限公司',leadName:'李四',indsyCode:'6432',regCpt:1250000.00,provDate:'2020-05-26',limitTo:'2025-05-26',issueOrgan:'上海市市场监督局'}";
    	let sign = await web3.eth.accounts.sign(licContent,'0x785154a70d49e368e64c82fd457917905ad2e70e4aded78b5424ebe7b34a00bd');
    	console.log(sign.signature);
    	console.log(sign.signature.length);
    	let r = await instance.slice(sign.signature,0,64);
    	console.log(r);
    	console.log(r.length);
    	let s = await instance.slice(sign.signature,64,64);
    	console.log(s);
    	let res = await instance.verificate(licContent,sign.signature,'0xa468fb3adf2c5d7e19b6ba353862b7b195027b2b');
    	console.log(res.valueOf());
    	return res;
    }).then(function(result){
    	
    	assert.equal(true,result.valueOf());
    });
  });
  
});