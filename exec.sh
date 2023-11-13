#!/bin/bash

stack_name=$1

if [ -z "$stack_name" ]
then
  echo "Please provide the stack name as the first argument."
  exit 1
fi

echo "Receiving the state machine ARN from the CloudFormation stack..."
state_machine_arn=$(aws cloudformation describe-stacks --stack-name $stack_name --query "Stacks[0].Outputs[?OutputKey=='StockTradingStateMachineArn'].OutputValue" --output text --no-cli-pager)
echo "State machine ARN: $state_machine_arn"

echo "Starting the state machine execution..."
aws stepfunctions start-execution --state-machine-arn $state_machine_arn
echo "State machine execution started."
