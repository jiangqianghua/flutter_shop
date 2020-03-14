const serviceUrl = 'http://192.168.1.103:8081/';
const servicePath = {
  'homePageContent': serviceUrl + 'wxmini/homePageContent.json', // 商店首页信息
  'homePageBelowConten': serviceUrl + 'wxmini/homePageBelowConten.json', //商城底部显示区域
  'getCategory': serviceUrl + 'wxmini/getCategory.json', // 获取分类信息
  'getMallGoods': serviceUrl + 'wxmini/getMallGoods.json', // 获取商品分类的商品列表
  'getGoodsDetailById': serviceUrl + 'wxmini/getGoodsDetailById.json' // 商品详细信息
};

// const serviceUrl = 'http://test.baixingliangfan.cn/baixing/';
// const servicePath = {
//   'homePageContent': serviceUrl + 'wxmini/homePageContent',
// };