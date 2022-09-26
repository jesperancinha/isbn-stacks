import {defineConfig} from "cypress";

module.exports = defineConfig({
    e2e: {
        setupNodeEvents(on, config) {
            // implement node event listeners here
        },
        baseUrl: "http://localhost:8080",
        env: {
            'isbn-stacks-kofu_port': '8080',
            'isbn-stacks-reactive_port': '8081',
            'isbn-stacks-mvc_port': '8082',
        }
    },
});
