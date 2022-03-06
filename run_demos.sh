#!/bin/sh

echo "This shell script helps test all direct demos within our /demos/ folder"
echo "Script will call some demos with its own pre-defined values."
echo "Your plan has to allow some of the functionality for you to be able to use it"
echo "\n"

app_token=APP_TOKEN
private_key=PRIVATE_KEY
encryption_key=ENCRYPTION_KEY
video_token=VIDEO_TOKEN
stream_token=STREAM_TOKEN
video_file=./assets/video1s.mp4
image_file=./assets/image.png
push_token=PUSH_SERVICE_TOKEN
tags=demos,test,tag_update,php
filter_from="1646089200000"
filter_to="1646521200000"
filter_date=""
filter_query="device_views_by_os"
effect_profile=EFFECT_PROFILE_TOKEN
meta_profile=META_PROFILE_TOKEN
auth_token=SERVER_AUTH_TOKEN
effect_filter=gray # can be: gray, cartoon, lucis, edge, chill, charcoal, sketch
url=https://ziggeo.com/
encoding=jsonheader
events=video_create,video_delete
webhook_id=some_id
validation_code=123456


# Colors
COLOR_GREEN='\033[0;32m' # Green
COLOR_RED='\033[0;31m' # Red
COLOR_END='\033[0m'    # No Color

#########
# Demos #
#########

count_demos=0
count_with_errors=0

now=$(date +"%T")
echo "\n\n****************************************************************************************" >> run_demos_log.log
echo "\nCurrent time : $now" >> run_demos_log.log
echo "\n****************************************************************************************" >> run_demos_log.log

run_demo()
{
	echo "\nRunning demo: $1"
	echo "\nruby $@"
	echo "\nruby $@" >> run_demos_log.log
	ruby $@ >> run_demos_log.log
	result=$?
	count_demos=$((count_demos+1))

	if [ $result -ne 0 ]; then
		echo "\n${COLOR_RED}There was an error running${COLOR_END} $1"
		echo "\nThere was an error running $1" >> run_demos_log.log
		count_with_errors=$((count_with_errors+1))
		sleep 2
	else
		echo "${COLOR_GREEN}SUCCESS${COLOR_END}: The $1 finished without any errors"
		echo "SUCCESS: The $1 finished without any errors" >> run_demos_log.log
	fi

	sleep 2
}


# Videos
	run_demo ./demos/videos_count.rb $app_token $private_key
	run_demo ./demos/videos_create.rb $app_token $private_key $video_file
	run_demo ./demos/videos_get.rb $app_token $private_key $video_token
	run_demo ./demos/videos_get_bulk.rb $app_token $private_key $video_token
	run_demo ./demos/videos_index.rb $app_token $private_key
	run_demo ./demos/videos_push_to_service.rb $app_token $private_key $video_tokens $push_token
	run_demo ./demos/videos_get_stats.rb $app_token $private_key $video_token
	run_demo ./demos/videos_stats_bulk.rb $app_token $private_key $video_token
	run_demo ./demos/videos_apply_effect.rb $app_token $private_key $video_token $effect_profile
	run_demo ./demos/videos_apply_meta.rb $app_token $private_key $video_token $meta_profile
	run_demo ./demos/videos_download_image.rb $app_token $private_key $video_token "ruby-image.jpg"
	run_demo ./demos/videos_download_video.rb $app_token $private_key $video_token "ruby-video.mp4"
	run_demo ./demos/videos_update.rb $app_token $private_key $video_token
	run_demo ./demos/videos_update_bulk.rb $app_token $private_key $video_token


# Streams


# Analytics


# Application
	run_demo ./demos/application_get_stats.rb $app_token $private_key


# Authtokens
	run_demo ./demos/authtokens_create.rb $app_token $private_key


# Effect Profiles


# Meta Profiles


# Webhooks
	# Webhook demos can never fully qualify due to the nature of how webhooks work. Ideally your confirm python file would exist on publicly available location to confirm the create call and delete requires it to exist
	run_demo ./demos/webhooks_create.rb $app_token $private_key $url $encoding $events
	run_demo ./demos/webhooks_confirm.rb $app_token $private_key $url $webhook_id $validation_code
	run_demo ./demos/webhooks_delete.rb $app_token $private_key $url


# Permanent
	run_demo ./demos/videos_delete.rb $app_token $private_key $video_token


echo "Done! We have gone through all $count_demos demos"

if [ $count_with_errors -ge 1 ]; then
	echo "\n$count_with_errors out of $count_demos finished with the error"
fi