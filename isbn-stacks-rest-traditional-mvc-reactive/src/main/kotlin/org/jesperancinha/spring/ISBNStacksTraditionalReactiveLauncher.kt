package org.jesperancinha.spring

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication

@SpringBootApplication
class ISBNStacksTraditionalReactiveLauncher {
    companion object {
        @JvmStatic
        fun main(args: Array<String>) {
            SpringApplication.run(ISBNStacksTraditionalReactiveLauncher::class.java, *args)
        }

    }
}


