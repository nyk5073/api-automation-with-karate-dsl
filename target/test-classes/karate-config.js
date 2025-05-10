function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    goRestUrl: 'https://gorest.co.in',
    token: 'get_your_token_here', //from here https://gorest.co.in/my-account/access-tokens
  }
  if (env == 'dev') {
    config.goRestUrl = 'https://gorest.co.in';
  } else if (env == 'e2e') {
    config.goRestUrl = 'https://e2e.gorest.co.in';
  }
  return config;
}