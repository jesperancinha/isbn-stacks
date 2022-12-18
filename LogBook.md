# ISBN Stacks Log Book

<ins>20221218</ins>

Spring Fu does not currently support 3.0.0. As reported on issue https://github.com/spring-projects-experimental/spring-fu/issues/392, there is a chance it will not be supported at all.

Should this be the case, then that also means that Spring Fu has stopped evolving and in that case this project and the article will be changed to talk another technology that also supports declarative programming in rest services, such as Kotlin's [Ktor](https://ktor.io/).

Spring milestones repo also doesn't seem to be stable most of the time. This is another reason to reconsider Spring Fu as anything viable.

This exception was generated in the pipeline:

```shell
Downloading from spring-milestone: https://repo.spring.io/milestone/org/springframework/fu/spring-fu-kofu/0.5.1/spring-fu-kofu-0.5.1.pom
Downloading from central: https://repo.maven.apache.org/maven2/org/springframework/fu/spring-fu-kofu/0.5.1/spring-fu-kofu-0.5.1.pom
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for ISBN Stacks - Parent file 1.0-SNAPSHOT:
[INFO] 
[INFO] ISBN Stacks - Parent file .......................... SUCCESS [  5.554 s]
[INFO] ISBN Stacks - Common ............................... SUCCESS [  8.329 s]
[INFO] ISBN Stacks - Spring WebFlux reactive application .. SUCCESS [  4.907 s]
[INFO] ISBN Stacks - Spring KoFu Reactive Application ..... FAILURE [03:45 min]
[INFO] ISBN Stacks - Spring Web application ............... SKIPPED
[INFO] Spring KoFu Reactive Application With Nothing ...... SKIPPED
[INFO] ------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  04:06 min
[INFO] Finished at: 2022-12-18T12:15:29Z
[INFO] ------------------------------------------------------------------------
Error:  Failed to execute goal on project isbn-stacks-rest-kofu-mvc-reactive: Could not resolve dependencies for project org.jesperancinha.spring:isbn-stacks-rest-kofu-mvc-reactive:jar:1.0-SNAPSHOT: Failed to collect dependencies at org.springframework.fu:spring-fu-kofu:jar:0.5.1: Failed to read artifact descriptor for org.springframework.fu:spring-fu-kofu:jar:0.5.1: Could not transfer artifact org.springframework.fu:spring-fu-kofu:pom:0.5.1 from/to spring-milestone (https://repo.spring.io/milestone): transfer failed for https://repo.spring.io/milestone/org/springframework/fu/spring-fu-kofu/0.5.1/spring-fu-kofu-0.5.1.pom, status: 504 Gateway Time-out -> [Help 1]
Error:  
Error:  To see the full stack trace of the errors, re-run Maven with the -e switch.
Error:  Re-run Maven using the -X switch to enable full debug logging.
Error:  
Error:  For more information about the errors and possible solutions, please read the following articles:
Error:  [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/DependencyResolutionException
Error:  
Error:  After correcting the problems, you can resume the build with the command
Error:    mvn <args> -rf :isbn-stacks-rest-kofu-mvc-reactive
make: *** [Makefile:8: build-maven] Error 1
Error: Process completed with exit code 2.
```
