# isbn-stacks

---
[![Generic badge](https://img.shields.io/static/v1.svg?label=GitHub&message=ISBN%20Stacks%20📚%20&color=informational)](https://github.com/jesperancinha/isbn-stacks)
[![GitHub release](https://img.shields.io/github/release-pre/jesperancinha/isbn-stacks.svg)](#)
[![GitHub License](https://img.shields.io/badge/license-Apache%20License%202.0-blue.svg?style=flat)](https://www.apache.org/licenses/LICENSE-2.0)

[![CircleCI](https://circleci.com/gh/jesperancinha/isbn-stacks.svg?style=svg)](https://circleci.com/gh/jesperancinha/isbn-stacks)
[![Build status](https://ci.appveyor.com/api/projects/status/m7x1k6x67masmn0u?svg=true)](https://ci.appveyor.com/project/jesperancinha/isbn-stacks)
[![isbn-stacks](https://github.com/jesperancinha/isbn-stacks/actions/workflows/isbn-stacks.yml/badge.svg)](https://github.com/jesperancinha/isbn-stacks/actions/workflows/isbn-stacks.yml)
[![e2e-isbn-stacks](https://github.com/jesperancinha/isbn-stacks/actions/workflows/isbn-stacks-e2e.yml/badge.svg)](https://github.com/jesperancinha/isbn-stacks/actions/workflows/isbn-stacks-e2e.yml)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/527c3cb900ef4ca892c872d468b3dc75)](https://www.codacy.com/gh/jesperancinha/isbn-stacks/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=jesperancinha/isbn-stacks&amp;utm_campaign=Badge_Grade)
[![codebeat badge](https://codebeat.co/badges/c6c2aeb2-f160-4e68-8642-ac444c637ebb)](https://codebeat.co/projects/github-com-jesperancinha-isbn-stacks-main)
[![Known Vulnerabilities](https://snyk.io/test/github/jesperancinha/isbn-stacks/badge.svg)](https://snyk.io/test/github/jesperancinha/isbn-stacks)

[![Codacy Badge](https://app.codacy.com/project/badge/Coverage/527c3cb900ef4ca892c872d468b3dc75)](https://www.codacy.com/gh/jesperancinha/isbn-stacks/dashboard?utm_source=github.com&utm_medium=referral&utm_content=jesperancinha/isbn-stacks&utm_campaign=Badge_Coverage)
[![Coverage Status](https://coveralls.io/repos/github/jesperancinha/isbn-stacks/badge.svg?branch=main)](https://coveralls.io/github/jesperancinha/isbn-stacks?branch=main)
[![codecov](https://codecov.io/gh/jesperancinha/isbn-stacks/branch/main/graph/badge.svg?token=GNRWoqE9VL)](https://codecov.io/gh/jesperancinha/isbn-stacks)

[![GitHub language count](https://img.shields.io/github/languages/count/jesperancinha/isbn-stacks.svg)](#)
[![GitHub top language](https://img.shields.io/github/languages/top/jesperancinha/isbn-stacks.svg)](#)
[![GitHub top language](https://img.shields.io/github/languages/code-size/jesperancinha/isbn-stacks.svg)](#)

---

## Technologies used

---
[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-50/kotlin-50.png "Kotlin")](https://kotlinlang.org/)
[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-50/spring-50.png "Spring Framework")](https://spring.io/projects/spring-framework)
[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-50/spring-boot-50.png "Spring Boot")](https://spring.io/projects/spring-boot)
[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-50/spring-webflux-50.png)](https://docs.spring.io/spring-framework/docs/current/reference/html/web-reactive.html)
[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-50/apache-maven-50.png "Maven")](https://maven.apache.org/)
[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-50/locust-50.png "Locust")](https://locust.io/)
[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-50/swagger-50.png "Swagger")](https://swagger.io/)
[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-50/cypress-50.png "Cypress")](https://www.cypress.io/)

---

## Introduction

Worldwide, the number ISBN 13 is used. It is a massive collection of numbers which uniquely identify books per type and edition. Based on that, this project is here to evaluate the recent experimental project from the spring team called Spring-FU. A DSL that, when released, it will allow Spring applications to be developed without the use of annotations. The main argument is that annotations bring unnecessary overhead to the application and that processing time can be avoided. The Spring-FU projecct started in GitHub on the 31st of  May 2018.

This repo is also the official support repo to my article on medium:

[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-20/medium-20.png "ISBN Stacks — A look at a possible Spring Application implementation without annotations")](https://itnext.io/isbn-stacks-a-look-at-a-possible-spring-application-implementation-without-annotations-ca1528591fe) [ISBN Stacks — A look at a possible Spring Application implementation without annotations](https://itnext.io/isbn-stacks-a-look-at-a-possible-spring-application-implementation-without-annotations-ca1528591fe)

<div align="center">
      <a title="ISBN Stacks — A look at a possible Spring Application implementation without annotations" href="https://itnext.io/isbn-stacks-a-look-at-a-possible-spring-application-implementation-without-annotations-ca1528591fe">
     <img 
          src="./docs/images/article.isbns.banner.jpg"
          style="width:100%;">
      </a>
</div>

#### Stable releases

-   [1.0.0](https://github.com/jesperancinha/isbn-stacks/tree/1.0.0) - [d76ef9d6316e97210ff8a9759e7f1bc811ebc153](https://github.com/jesperancinha/isbn-stacks/tree/1.0.0) - Last working version before Spring 3.0.0

## Project Layout

-   [ISBN Stacks - Common](./isbn-stacks-common) - The common library where the static source data resides
-   [ISBN Stacks - Spring KoFu Reactive Application](./isbn-stacks-rest-kofu-mvc-reactive) - Spring KoFu reactive application implemented in Kotlin
-   [Spring KoFu Reactive Application With Nothing](./isbn-stacks-rest-kofu-plain) - Spring KoFu implementatio completely stripped of extra functions to be used as a reference control in the performance tests.
-   [ISBN Stacks - Spring Web application](./isbn-stacks-rest-traditional-mvc-non-reactive) - Spring Web Application implemented in a non-reactive way.
-   [ISBN Stacks - Spring WebFlux reactive application](./isbn-stacks-rest-traditional-mvc-reactive) - Spring WebFlux Application implemented in a reactive way.
-   [locust](./locust) - The location of all Locust tests

## Sequence diagram

To visualize this diagram you may need the [mermaid-diagrams](https://chrome.google.com/webstore/detail/mermaid-diagrams/phfcghedmopjadpojhmmaffjmfiakfil) plugin installation.

To visualize it in Intellij, please install the [mermaid plugin](https://mermaid-js.github.io/mermaid/#/).

```mermaid
    sequenceDiagram
        participant Locust
        participant ISBN Non Reactice Traditional REST
        participant ISBN Reactive Traditional REST
        participant ISBN Reactice KoFu REST
        
        Locust-->> ISBN Non Reactice Traditional REST: Request ISBN numbers
        Locust-->>ISBN Reactive Traditional REST: Request ISBN numbers
        Locust-->>ISBN Reactice KoFu REST: Request ISBN numbers
        ISBN Non Reactice Traditional REST-->>Locust: Response with ISBN numbers
        ISBN Reactive Traditional REST-->>Locust: Response with ISBN numbers
        ISBN Reactice KoFu REST-->>Locust: Respond with ISBN numbers
```
## Java Setup

```shell
sdk install java 17-open
sdk use java 17-open
```

## References

-   [The evolution of Spring Fu](https://spring.io/blog/2018/10/02/the-evolution-of-spring-fu)
-   [The State of Kotlin Support in Spring](https://blog.jetbrains.com/kotlin/2020/08/the-state-of-kotlin-support-in-spring/)
-   [Spring Fu 0.3.0 and beyond](https://spring.io/blog/2020/05/28/spring-fu-0-3-0-and-beyond)
-   [Mermaid Live Editor](https://mermaid-js.github.io/mermaid-live-editor)
-   [Spring Framework 5.0 Released](https://www.infoq.com/news/2017/10/spring-5-released/)
-   [JAX Innovation Award Winners](https://blogs.eclipse.org/post/ian-skerrett/jax-innovation-award-winners)
-   [Agitar Wins 2006 Software Development Magazine Productivity Award](http://www.agitar.com/news/pr/20060322.html)
-   [16th Jolt Awards 2006](http://blog.sina.com.tw/4907/article.php?pbgid=4907&entryid=12167)
-   [The 16th annual jolt product Excellence Award winners)](https://topic.alibabacloud.com/a/the-16th-annual-jolt-product-excellence-award-winners_8_8_32396776.html)
-   [JetBrains Products Win Jolt Productivity Awards](https://blog.jetbrains.com/idea/2006/03/jetbrains-products-win-jolt-productivity-awards/)
-   [Spring Framework](https://en.wikipedia.org/wiki/Spring_Framework)
-   [java spring - natashasweety7/Software Wiki](https://github-wiki-see.page/m/natashasweety7/Software/wiki/java-spring)
-   [A Guide to Spring Framework Annotations](https://dzone.com/articles/a-guide-to-spring-framework-annotations)
-   [What is New in Spring Framework 4.x](https://www.dineshonjava.com/whats-new-in-spring-framework-4x/)
-   [Nicolas Fränkel-Annotation-free Spring](https://nfrankel.medium.com/annotation-free-spring-dcdbefd57fe8)
-   [Spring-Fu GitHub Repo](https://github.com/spring-projects-experimental/spring-fu)
-   [Spring KoFu](https://github.com/spring-projects-experimental/spring-fu/tree/main/kofu)

## About me

<div align="center">

[![alt text](https://raw.githubusercontent.com/jesperancinha/project-signer/master/project-signer-templates/icons-100/JEOrgLogo-27.png "João Esperancinha Homepage")](http://joaofilipesabinoesperancinha.nl)
[![](https://img.shields.io/badge/youtube-%230077B5.svg?style=for-the-badge&logo=youtube&color=FF0000)](https://www.youtube.com/@joaoesperancinha)
[![](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@jofisaes)
[![](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-%230077B5.svg?style=for-the-badge&logo=buymeacoffee&color=yellow)](https://www.buymeacoffee.com/jesperancinha)
[![](https://img.shields.io/badge/Twitter-%230077B5.svg?style=for-the-badge&logo=twitter&color=white)](https://twitter.com/joaofse)
[![](https://img.shields.io/badge/Mastodon-%230077B5.svg?style=for-the-badge&logo=mastodon&color=afd7f7)](https://masto.ai/@jesperancinha)
[![](https://img.shields.io/badge/Sessionize-%230077B5.svg?style=for-the-badge&logo=sessionize&color=cffff6)](https://sessionize.com/joao-esperancinha)
[![](https://img.shields.io/badge/Instagram-%230077B5.svg?style=for-the-badge&logo=instagram&color=purple)](https://www.instagram.com/joaofisaes)
[![](https://img.shields.io/badge/Tumblr-%230077B5.svg?style=for-the-badge&logo=tumblr&color=192841)](https://jofisaes.tumblr.com)
[![](https://img.shields.io/badge/Spotify-1ED760?style=for-the-badge&logo=spotify&logoColor=white)](https://open.spotify.com/user/jlnozkcomrxgsaip7yvffpqqm)
[![](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/joaoesperancinha/)
[![](https://img.shields.io/badge/Xing-%230077B5.svg?style=for-the-badge&logo=xing&color=064e40)](https://www.xing.com/profile/Joao_Esperancinha/cv)
[![](https://img.shields.io/badge/YCombinator-%230077B5.svg?style=for-the-badge&logo=ycombinator&color=d0d9cd)](https://news.ycombinator.com/user?id=jesperancinha)
[![GitHub followers](https://img.shields.io/github/followers/jesperancinha.svg?label=Jesperancinha&style=for-the-badge&logo=github&color=grey "GitHub")](https://github.com/jesperancinha)
[![](https://img.shields.io/badge/bitbucket-%230077B5.svg?style=for-the-badge&logo=bitbucket&color=blue)](https://bitbucket.org/jesperancinha)
[![](https://img.shields.io/badge/gitlab-%230077B5.svg?style=for-the-badge&logo=gitlab&color=orange)](https://gitlab.com/jesperancinha)
[![](https://img.shields.io/badge/Stack%20Overflow-%230077B5.svg?style=for-the-badge&logo=stackoverflow&color=5A5A5A)](https://stackoverflow.com/users/3702839/joao-esperancinha)
[![](https://img.shields.io/badge/Credly-%230077B5.svg?style=for-the-badge&logo=credly&color=064e40)](https://www.credly.com/users/joao-esperancinha)
[![](https://img.shields.io/badge/Coursera-%230077B5.svg?style=for-the-badge&logo=coursera&color=000080)](https://www.coursera.org/user/da3ff90299fa9297e283ee8e65364ffb)
[![](https://img.shields.io/badge/Docker-%230077B5.svg?style=for-the-badge&logo=docker&color=cyan)](https://hub.docker.com/u/jesperancinha)
[![](https://img.shields.io/badge/Reddit-%230077B5.svg?style=for-the-badge&logo=reddit&color=black)](https://www.reddit.com/user/jesperancinha/)
[![](https://img.shields.io/badge/Hackernoon-%230077B5.svg?style=for-the-badge&logo=hackernoon&color=0a5d00)](https://hackernoon.com/@jesperancinha)
[![](https://img.shields.io/badge/Code%20Project-%230077B5.svg?style=for-the-badge&logo=codeproject&color=063b00)](https://www.codeproject.com/Members/jesperancinha)
[![](https://img.shields.io/badge/Free%20Code%20Camp-%230077B5.svg?style=for-the-badge&logo=freecodecamp&color=0a5d00)](https://www.freecodecamp.org/jofisaes)
[![](https://img.shields.io/badge/Hackerrank-%230077B5.svg?style=for-the-badge&logo=hackerrank&color=1e2f97)](https://www.hackerrank.com/jofisaes)
[![](https://img.shields.io/badge/LeetCode-%230077B5.svg?style=for-the-badge&logo=leetcode&color=002647)](https://leetcode.com/jofisaes)
[![](https://img.shields.io/badge/Codewars-%230077B5.svg?style=for-the-badge&logo=codewars&color=722F37)](https://www.codewars.com/users/jesperancinha)
[![](https://img.shields.io/badge/CodePen-%230077B5.svg?style=for-the-badge&logo=codepen&color=black)](https://codepen.io/jesperancinha)
[![](https://img.shields.io/badge/HackerEarth-%230077B5.svg?style=for-the-badge&logo=hackerearth&color=00035b)](https://www.hackerearth.com/@jofisaes)
[![](https://img.shields.io/badge/Khan%20Academy-%230077B5.svg?style=for-the-badge&logo=khanacademy&color=00035b)](https://www.khanacademy.org/profile/jofisaes)
[![](https://img.shields.io/badge/Pinterest-%230077B5.svg?style=for-the-badge&logo=pinterest&color=FF0000)](https://nl.pinterest.com/jesperancinha)
[![](https://img.shields.io/badge/Quora-%230077B5.svg?style=for-the-badge&logo=quora&color=FF0000)](https://nl.quora.com/profile/Jo%C3%A3o-Esperancinha)
[![](https://img.shields.io/badge/Google%20Play-%230077B5.svg?style=for-the-badge&logo=googleplay&color=purple)](https://play.google.com/store/apps/developer?id=Joao+Filipe+Sabino+Esperancinha)
| [Sonatype Search Repos](https://search.maven.org/search?q=org.jesperancinha)
| [Dev.TO](https://dev.to/jofisaes)
| [Codebyte](https://coderbyte.com/profile/jesperancinha)
| [InfoQ](https://www.infoq.com/profile/Joao-Esperancinha.2/)
[![](https://img.shields.io/badge/OCP%20Java%2011-%230077B5.svg?style=for-the-badge&logo=oracle&color=064e40)](https://www.credly.com/badges/87609d8e-27c5-45c9-9e42-60a5e9283280)
[![](https://img.shields.io/badge/OCP%20JEE%207-%230077B5.svg?style=for-the-badge&logo=oracle&color=064e40)](https://www.credly.com/badges/27a14e06-f591-4105-91ca-8c3215ef39a2)
[![](https://img.shields.io/badge/VMWare%20Spring%20Professional%202021-%230077B5.svg?style=for-the-badge&logo=spring&color=064e40)](https://www.credly.com/badges/762fa7a4-9cf4-417d-bd29-7e072d74cdb7)
[![](https://img.shields.io/badge/IBM%20Cybersecurity%20Analyst%20Professional-%230077B5.svg?style=for-the-badge&logo=ibm&color=064e40)](https://www.credly.com/badges/ad1f4abe-3dfa-4a8c-b3c7-bae4669ad8ce)
[![](https://img.shields.io/badge/Deep%20Learning-%230077B5.svg?style=for-the-badge&logo=ibm&color=064e40)](https://www.credly.com/badges/8d27e38c-869d-4815-8df3-13762c642d64)
[![](https://img.shields.io/badge/Certified%20Neo4j%20Professional-%230077B5.svg?style=for-the-badge&logo=neo4j&color=064e40)](https://graphacademy.neo4j.com/certificates/c279afd7c3988bd727f8b3acb44b87f7504f940aac952495ff827dbfcac024fb.pdf)
[![](https://img.shields.io/badge/Certified%20Advanced%20JavaScript%20Developer-%230077B5.svg?style=for-the-badge&logo=javascript&color=064e40)](https://cancanit.com/certified/1462/)
[![](https://img.shields.io/badge/Kong%20Champions-%230077B5.svg?style=for-the-badge&logo=kong&color=064e40)](https://konghq.com/kong-champions)
[![Generic badge](https://img.shields.io/static/v1.svg?label=GitHub&message=JEsperancinhaOrg&color=064e40&style=for-the-badge "jesperancinha.org dependencies")](https://github.com/JEsperancinhaOrg)
[![Generic badge](https://img.shields.io/static/v1.svg?label=All%20Badges&message=Badges&color=064e40&style=for-the-badge "All badges")](https://joaofilipesabinoesperancinha.nl/badges)
[![Generic badge](https://img.shields.io/static/v1.svg?label=Status&message=Project%20Status&color=orange&style=for-the-badge "Project statuses")](https://github.com/jesperancinha/project-signer/blob/master/project-signer-quality/Build.md)

</div>
