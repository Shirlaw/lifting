({
    baseUrl: ".",
    //optimize: 'none',
    paths: {
        cs: 'require-plugins/cs',
        //tpl: 'require-plugins/tpl',
        text: 'require-plugins/text',
        domReady: 'require-plugins/domReady',
        jquery: 'lib/jquery',
        underscore: 'lib/underscore',
        backbone: 'lib/backbone'
    },
    name: "main",
    out: "main-built.js"
})