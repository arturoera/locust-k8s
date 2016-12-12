#!/usr/bin/env python

from datetime import datetime
from locust import HttpLocust, TaskSet, task


class MetricsTaskSet(TaskSet):

    @task(1)
    def root(self):
        self.client.get("/")

    @task(2)
    def login(self):
        self.client.post("accounts/login/", {"username": "test", "password": "secret"})


class MetricsLocust(HttpLocust):
    task_set = MetricsTaskSet
