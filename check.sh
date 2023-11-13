#!/bin/bash

execution_arn=$1

if [ -z "$execution_arn" ]
then
  echo "Please provide the execution ARN as the first argument."
  exit 1
fi

echo "Checking the state machine execution status..."
aws stepfunctions describe-execution --execution-arn $execution_arn --query "status" --output text --no-cli-pager
echo "State machine execution status checked."
