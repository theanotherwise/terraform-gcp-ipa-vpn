# Kubernetes Regional Cluster on GCP

## Get credentials

```bash
gcloud auth login

# zonal cluster
gcloud container clusters get-credentials example --zone=us-central1-c

# regional
gcloud container clusters get-credentials example --region=us-central1
``` 
