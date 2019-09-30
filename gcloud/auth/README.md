# Service Authentication

For applications deployed through Kubernetes:
* Use a service account where the credentials are stored as secrets.
* Mount the secrets as a volume within the application image.
* Point the GOOGLE_APPLICATION_CREDENTIALS environment variable to the location where secrets are mounted.
* Use the default application credentials approach, which instructs client creation to make use of the configured environment variable.

A reference tutorial can be found [here](https://cloud.google.com/kubernetes-engine/docs/tutorials/authenticating-to-cloud-platform).
