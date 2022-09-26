import {defineConfig} from "cypress";

module.exports = defineConfig({
    e2e: {
        setupNodeEvents(on, config) {
            // implement node event listeners here
        },
        includeShadowDom: true,
        video: false,
        screenshotOnRunFailure: false,
        baseUrl: "http://isbn-stacks-kofu:8080",
        env: {
            'isbn-stacks-kofu': 'isbn-stacks-kofu',
            'isbn-stacks-reactive': 'isbn-stacks-reactive',
            'isbn-stacks-mvc': 'isbn-stacks-mvc',
            'isbn-stacks-kofu_port': '8080',
            'isbn-stacks-reactive_port': '8081',
            'isbn-stacks-mvc_port': '8082',
        }
    },
    chromeWebSecurity: false
});
