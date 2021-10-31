from locust import HttpUser, task


class ISBNStacksTest(HttpUser):
    @task
    def hello_traditional_non_reactive_api(self):
        self.client.get("http://localhost:8082/api/traditional/non")

    @task
    def hello_traditional_reactive_api(self):
        self.client.get("http://localhost:8081/api/traditional")

    @task
    def hello_kofu_reactive_api(self):
        self.client.get("http://localhost:8080/api/kofu")

    @task
    def hello_traditional_non_reactive(self):
        self.client.get("http://localhost:8082/api/traditional/non/hello")

    @task
    def hello_traditional_reactive(self):
        self.client.get("http://localhost:8081/api/traditional/hello")

    @task
    def hello_kofu_reactive(self):
        self.client.get("http://localhost:8080/api/kofu/hello")

    @task
    def retrieve_isbn_via_traditional_non_reactive(self):
        self.client.get("http://localhost:8082/api/traditional/non/isbns")

    @task
    def retrieve_isbn_via_traditional_reactive(self):
        self.client.get("http://localhost:8081/api/traditional/isbns")

    @task
    def retrieve_isbn_via_kofu_reactive(self):
        self.client.get("http://localhost:8080/api/kofu/isbns")
