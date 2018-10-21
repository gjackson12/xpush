#!/bin/sh

# Set variables for script
DATETIMESTAMP=$(date +%F_%H-%M-%S)
S3_ARTIFACT_NAME="angular$DATETIMESTAMP.zip"
BUCKET_NAME="gjackson"
GIT_STATUS="$(git status -unormal 2>&1)"

if [[ "$GIT_STATUS" =~ On\ branch\ ([^[:space:]]+) ]]; then
  branch=${BASH_REMATCH[1]}
	echo "${branch}"
	if [ "${branch}" == "master" ]; then
		echo "Zipping up project artifacts..."

		zip -r -X $S3_ARTIFACT_NAME .

		echo "Deleting project file from S3 Bucket..."

		s3cmd del s3://$BUCKET_NAME/$S3_ARTIFACT_NAME

		echo "Uploading project file to S3 Bucket..."

		s3cmd put $S3_ARTIFACT_NAME s3://$BUCKET_NAME/$S3_ARTIFACT_NAME
	else
		echo "You must be on the master branch to execute a pushx operation..."
	fi
fi
