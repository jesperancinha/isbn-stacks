package org.jesperancinha.spring.traditional

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication

@SpringBootApplication
class ISBNStacksTraditionalNonReactiveLauncher {
    companion object {
        @JvmStatic
        fun main(args: Array<String>) {
            SpringApplication.run(ISBNStacksTraditionalNonReactiveLauncher::class.java, *args)
        }

    }
}


