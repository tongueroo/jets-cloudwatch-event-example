class SecurityJob < ApplicationJob
  rule_event(
    source: ["aws.ec2"],
    detail_type: ["EC2 Instance State-change Notification"],
    detail: {
      state: ["stopping"],
    }
  )
  def instance_stopping
    puts "event #{JSON.dump(event)}" # event is available
    # logic goes here
  end
end
