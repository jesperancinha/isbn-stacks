package org.jesperancinha.spring

import org.jesperancinha.spring.IsbnDto.Companion.ISBNS
import org.jesperancinha.spring.IsbnDto.Companion.SMALL_ISBNS
import org.springframework.boot.web.reactive.context.ReactiveWebServerApplicationContext
import org.springframework.context.aot.AotApplicationContextInitializer
import org.springframework.fu.kofu.reactiveWebApplication
import org.springframework.fu.kofu.webflux.webFlux
import org.springframework.web.reactive.function.server.ServerRequest
import org.springframework.web.reactive.function.server.ServerResponse
import reactor.core.publisher.Mono

val app = reactiveWebApplication {
    beans {
        bean<SampleHandler>()
    }
    webFlux {
        port = if (profiles.contains("test")) 8181 else 8080
        router {
            val handler = ref<SampleHandler>()
            GET("/api/kofu/hello",handler::hello )
        }
        codecs {
            string()
            jackson()
        }
    }
}

class SampleHandler {
    fun hello(request: ServerRequest): Mono<ServerResponse> = ServerResponse.ok().bodyValue("hello")
}


class ISBNStacksNothingLauncher{
    companion object{
        @JvmStatic
        fun main(args: Array<String>) {
            app.run()
        }
    }
    class Companion__ApplicationContextInitializer :
        AotApplicationContextInitializer<ReactiveWebServerApplicationContext> {
        override fun initialize(applicationContext: ReactiveWebServerApplicationContext) {
            applicationContext.registerBean(SampleHandler::class.java, *arrayOf())
        }
    }
}
