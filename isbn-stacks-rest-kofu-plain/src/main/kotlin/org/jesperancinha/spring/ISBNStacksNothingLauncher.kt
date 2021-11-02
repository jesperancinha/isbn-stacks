package org.jesperancinha.spring

import org.jesperancinha.spring.IsbnDto.Companion.ISBNS
import org.jesperancinha.spring.IsbnDto.Companion.SMALL_ISBNS
import org.springframework.fu.kofu.reactiveWebApplication
import org.springframework.fu.kofu.webflux.webFlux
import org.springframework.web.reactive.function.server.ServerRequest
import org.springframework.web.reactive.function.server.ServerResponse

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
    fun hello(request: ServerRequest) = ServerResponse.ok().bodyValue("hello")
}


class ISBNStacksNothingLauncher{
    companion object{
        @JvmStatic
        fun main(args: Array<String>) {
            app.run()
        }
    }
}


