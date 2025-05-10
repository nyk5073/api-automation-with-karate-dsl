function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    goRestUrl: 'https://gorest.co.in',
    token: '3d437e9bc88ddc39b5898a659f6f2a91e0095df8dadacadb01649110a6f36eed'
  }
  if (env == 'dev') {
    config.goRestUrl = 'https://gorest.co.in';
  } else if (env == 'e2e') {
    config.goRestUrl = 'https://e2e.gorest.co.in';
  }
  return config;
}