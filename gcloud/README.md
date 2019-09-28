# Bigtable Setup

gcloud beta dataflow jobs run import-bus-data-$(date +%s) --gcs-location gs://dataflow-templates/latest/GCS_SequenceFile_to_Cloud_Bigtable --num-workers=$NUM_WORKERS --max-workers=$NUM_WORKERS --parameters "bigtableProject=bigtable-test-254214,bigtableInstanceId=$INSTANCE_ID,bigtableTableId=$TABLE_ID,sourcePattern=gs://cloud-bigtable-public-datasets/bus-data/*" --region us-east1
