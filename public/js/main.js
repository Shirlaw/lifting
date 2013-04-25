require({
    paths: {
        text: 'require-plugins/text',
        cs: 'require-plugins/cs',
        //tpl: 'require-plugins/tpl',
        domReady: 'require-plugins/domReady',
        jquery: 'lib/jquery',
        underscore: 'lib/underscore',
        backbone: 'lib/backbone',
        fastclick: 'lib/fastclick'
    }
  }, [
    //dependancies
    'jquery',
    'underscore',
    'backbone',
    'cs!bootstrap'
  ]
);
