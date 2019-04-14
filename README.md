# Ziggeo Ruby Server SDK 2.15

Ziggeo API (https://ziggeo.com) allows you to integrate video recording and playback with only
two lines of code in your site, service or app. This is the Ruby Server SDK repository.

Pull requests welcome.


## Installation

For Rails applications, you can simply install this repository as a gem.

gem "Ziggeo"


## Client-Side Integration

For the client-side integration, you need to add these assets to your html file:

```html 
<link rel="stylesheet" href="//assets-cdn.ziggeo.com/v2-stable/ziggeo.css" />
<script src="//assets-cdn.ziggeo.com/v2-stable/ziggeo.js"></script>
```

Then, you need to specify your api token:
```html 
<script>
    var ziggeoApplication = new ZiggeoApi.V2.Application({
        token: "APPLICATION_TOKEN"
    });
</script>
```

You can specify other global options, [see here](https://ziggeo.com/docs).

To fire up a recorder on your page, add:
```html 
<ziggeorecorder></ziggeorecorder>
``` 

To embed a player for an existing video, add:
```html 
<ziggeoplayer ziggeo-video='video-token'></ziggeoplayer>
``` 

For the full documentation, please visit [ziggeo.com](https://ziggeo.com/docs).



## Server-Side Integration

You can integrate the Server SDK as follows:

```ruby 
@ziggeo = Ziggeo.new("*token*", "*private_key*", "*encryption_key*") 
```


## Server-Side Methods

### Videos  

The videos resource allows you to access all single videos. Each video may contain more than one stream. 
 

#### Index 
 
Query an array of videos (will return at most 50 videos by default). Newest videos come first. 

```ruby 
ziggeo.videos().index(arguments = nil) 
``` 
 
Arguments 
- limit: *Limit the number of returned videos. Can be set up to 100.* 
- skip: *Skip the first [n] entries.* 
- reverse: *Reverse the order in which videos are returned.* 
- states: *Filter videos by state* 
- tags: *Filter the search result to certain tags, encoded as a comma-separated string* 


#### Count 
 
Get the video count for the application. 

```ruby 
ziggeo.videos().count(arguments = nil) 
``` 
 
Arguments 
- states: *Filter videos by state* 
- tags: *Filter the search result to certain tags, encoded as a comma-separated string* 


#### Get 
 
Get a single video by token or key. 

```ruby 
ziggeo.videos().get(token_or_key) 
``` 
 


#### Get Bulk 
 
Get multiple videos by tokens or keys. 

```ruby 
ziggeo.videos().get_bulk(arguments = nil) 
``` 
 
Arguments 
- tokens_or_keys: *Comma-separated list with the desired videos tokens or keys (Limit: 100 tokens or keys).* 


#### Stats Bulk 
 
Get stats for multiple videos by tokens or keys. 

```ruby 
ziggeo.videos().stats_bulk(arguments = nil) 
``` 
 
Arguments 
- tokens_or_keys: *Comma-separated list with the desired videos tokens or keys (Limit: 100 tokens or keys).* 
- summarize: *Boolean. Set it to TRUE to get the stats summarized. Set it to FALSE to get the stats for each video in a separate array. Default: TRUE.* 


#### Download Video 
 
Download the video data file 

```ruby 
ziggeo.videos().download_video(token_or_key) 
``` 
 


#### Download Image 
 
Download the image data file 

```ruby 
ziggeo.videos().download_image(token_or_key) 
``` 
 


#### Get Stats 
 
Get the video's stats 

```ruby 
ziggeo.videos().get_stats(token_or_key) 
``` 
 


#### Push To Service 
 
Push a video to a provided push service. 

```ruby 
ziggeo.videos().push_to_service(token_or_key, arguments = nil) 
``` 
 
Arguments 
- pushservicetoken: *Push Services's token (from the Push Services configured for the app)* 


#### Apply Effect 
 
Apply an effect profile to a video. 

```ruby 
ziggeo.videos().apply_effect(token_or_key, arguments = nil) 
``` 
 
Arguments 
- effectprofiletoken: *Effect Profile token (from the Effect Profiles configured for the app)* 


#### Apply Meta 
 
Apply a meta profile to a video. 

```ruby 
ziggeo.videos().apply_meta(token_or_key, arguments = nil) 
``` 
 
Arguments 
- metaprofiletoken: *Meta Profile token (from the Meta Profiles configured for the app)* 


#### Update 
 
Update single video by token or key. 

```ruby 
ziggeo.videos().update(token_or_key, arguments = nil) 
``` 
 
Arguments 
- min_duration: *Minimal duration of video* 
- max_duration: *Maximal duration of video* 
- tags: *Video Tags* 
- key: *Unique (optional) name of video* 
- volatile: *Automatically removed this video if it remains empty* 
- expiration_days: *After how many days will this video be deleted* 


#### Update Bulk 
 
Update multiple videos by token or key. 

```ruby 
ziggeo.videos().update_bulk(arguments = nil) 
``` 
 
Arguments 
- tokens_or_keys: *Comma-separated list with the desired videos tokens or keys (Limit: 100 tokens or keys).* 
- min_duration: *Minimal duration of video* 
- max_duration: *Maximal duration of video* 
- tags: *Video Tags* 
- volatile: *Automatically removed this video if it remains empty* 
- expiration_days: *After how many days will this video be deleted* 


#### Delete 
 
Delete a single video by token or key. 

```ruby 
ziggeo.videos().delete(token_or_key) 
``` 
 


#### Create 
 
Create a new video. 

```ruby 
ziggeo.videos().create(arguments = nil, file = nil) 
``` 
 
Arguments 
- file: *Video file to be uploaded* 
- min_duration: *Minimal duration of video* 
- max_duration: *Maximal duration of video* 
- tags: *Video Tags* 
- key: *Unique (optional) name of video* 
- volatile: *Automatically removed this video if it remains empty* 


#### Analytics 
 
Get analytics for a specific videos with the given params 

```ruby 
ziggeo.videos().analytics(token_or_key, arguments = nil) 
``` 
 
Arguments 
- from: *A UNIX timestamp in microseconds used as the start date of the query* 
- to: *A UNIX timestamp in microseconds used as the end date of the query* 
- date: *A UNIX timestamp in microseconds to retrieve data from a single date. If set, it overwrites the from and to params.* 
- query: *The query you want to run. It can be one of the following: device_views_by_os, device_views_by_date, total_plays_by_country, full_plays_by_country, total_plays_by_hour, full_plays_by_hour, total_plays_by_browser, full_plays_by_browser* 


### Streams  

The streams resource allows you to directly access all streams associated with a single video. 
 

#### Index 
 
Return all streams associated with a video 

```ruby 
ziggeo.streams().index(video_token_or_key, arguments = nil) 
``` 
 
Arguments 
- states: *Filter streams by state* 


#### Get 
 
Get a single stream 

```ruby 
ziggeo.streams().get(video_token_or_key, token_or_key) 
``` 
 


#### Download Video 
 
Download the video data associated with the stream 

```ruby 
ziggeo.streams().download_video(video_token_or_key, token_or_key) 
``` 
 


#### Download Image 
 
Download the image data associated with the stream 

```ruby 
ziggeo.streams().download_image(video_token_or_key, token_or_key) 
``` 
 


#### Push To Service 
 
Push a stream to a provided push service. 

```ruby 
ziggeo.streams().push_to_service(video_token_or_key, token_or_key, arguments = nil) 
``` 
 
Arguments 
- pushservicetoken: *Push Services's token (from the Push Services configured for the app)* 


#### Delete 
 
Delete the stream 

```ruby 
ziggeo.streams().delete(video_token_or_key, token_or_key) 
``` 
 


#### Create 
 
Create a new stream 

```ruby 
ziggeo.streams().create(video_token_or_key, arguments = nil, file = nil) 
``` 
 
Arguments 
- file: *Video file to be uploaded* 


#### Attach Image 
 
Attaches an image to a new stream 

```ruby 
ziggeo.streams().attach_image(video_token_or_key, token_or_key, arguments = nil, file = nil) 
``` 
 
Arguments 
- file: *Image file to be attached* 


#### Attach Video 
 
Attaches a video to a new stream 

```ruby 
ziggeo.streams().attach_video(video_token_or_key, token_or_key, arguments = nil, file = nil) 
``` 
 
Arguments 
- file: *Video file to be attached* 


#### Bind 
 
Closes and submits the stream 

```ruby 
ziggeo.streams().bind(video_token_or_key, token_or_key, arguments = nil) 
``` 
 


### Authtokens  

The auth token resource allows you to manage authorization settings for video objects. 
 

#### Get 
 
Get a single auth token by token. 

```ruby 
ziggeo.authtokens().get(token) 
``` 
 


#### Update 
 
Update single auth token by token. 

```ruby 
ziggeo.authtokens().update(token_or_key, arguments = nil) 
``` 
 
Arguments 
- volatile: *Will this object automatically be deleted if it remains empty?* 
- hidden: *If hidden, the token cannot be used directly.* 
- expiration_date: *Expiration date for the auth token* 
- usage_experitation_time: *Expiration time per session* 
- session_limit: *Maximal number of sessions* 
- grants: *Permissions this tokens grants* 


#### Delete 
 
Delete a single auth token by token. 

```ruby 
ziggeo.authtokens().delete(token_or_key) 
``` 
 


#### Create 
 
Create a new auth token. 

```ruby 
ziggeo.authtokens().create(arguments = nil) 
``` 
 
Arguments 
- volatile: *Will this object automatically be deleted if it remains empty?* 
- hidden: *If hidden, the token cannot be used directly.* 
- expiration_date: *Expiration date for the auth token* 
- usage_experitation_time: *Expiration time per session* 
- session_limit: *Maximal number of sessions* 
- grants: *Permissions this tokens grants* 


### Application  

The application token resource allows you to manage your application. 
 

#### Get 
 
Read application. 

```ruby 
ziggeo.application().get() 
``` 
 


#### Update 
 
Update application. 

```ruby 
ziggeo.application().update(arguments = nil) 
``` 
 
Arguments 
- volatile: *Will this object automatically be deleted if it remains empty?* 
- name: *Name of the application* 
- auth_token_required_for_create: *Require auth token for creating videos* 
- auth_token_required_for_update: *Require auth token for updating videos* 
- auth_token_required_for_read: *Require auth token for reading videos* 
- auth_token_required_for_destroy: *Require auth token for deleting videos* 
- client_can_index_videos: *Client is allowed to perform the index operation* 
- client_cannot_access_unaccepted_videos: *Client cannot view unaccepted videos* 
- enable_video_subpages: *Enable hosted video pages* 


#### Get Stats 
 
Read application stats 

```ruby 
ziggeo.application().get_stats(arguments = nil) 
``` 
 
Arguments 
- period: *Optional. Can be 'year' or 'month'.* 


### EffectProfiles  

The effect profiles resource allows you to access and create effect profiles for your app. Each effect profile may contain one process or more. 
 

#### Create 
 
Create a new effect profile. 

```ruby 
ziggeo.effectProfiles().create(arguments = nil) 
``` 
 
Arguments 
- key: *Effect profile key.* 
- title: *Effect profile title.* 
- default_effect: *Boolean. If TRUE, sets an effect profile as default. If FALSE, removes the default status for the given effect* 


#### Index 
 
Get list of effect profiles. 

```ruby 
ziggeo.effectProfiles().index(arguments = nil) 
``` 
 
Arguments 
- limit: *Limit the number of returned effect profiles. Can be set up to 100.* 
- skip: *Skip the first [n] entries.* 
- reverse: *Reverse the order in which effect profiles are returned.* 


#### Get 
 
Get a single effect profile 

```ruby 
ziggeo.effectProfiles().get(token_or_key) 
``` 
 


#### Delete 
 
Delete the effect profile 

```ruby 
ziggeo.effectProfiles().delete(token_or_key) 
``` 
 


#### Update 
 
Updates an effect profile. 

```ruby 
ziggeo.effectProfiles().update(token_or_key, arguments = nil) 
``` 
 
Arguments 
- default_effect: *Boolean. If TRUE, sets an effect profile as default. If FALSE, removes the default status for the given effect* 


### EffectProfileProcess  

The process resource allows you to directly access all process associated with a single effect profile. 
 

#### Index 
 
Return all processes associated with a effect profile 

```ruby 
ziggeo.effectProfileProcess().index(effect_token_or_key, arguments = nil) 
``` 
 
Arguments 
- states: *Filter streams by state* 


#### Get 
 
Get a single process 

```ruby 
ziggeo.effectProfileProcess().get(effect_token_or_key, token_or_key) 
``` 
 


#### Delete 
 
Delete the process 

```ruby 
ziggeo.effectProfileProcess().delete(effect_token_or_key, token_or_key) 
``` 
 


#### Create Filter Process 
 
Create a new filter effect process 

```ruby 
ziggeo.effectProfileProcess().create_filter_process(effect_token_or_key, arguments = nil) 
``` 
 
Arguments 
- effect: *Effect to be applied in the process* 


#### Create Watermark Process 
 
Attaches an image to a new stream 

```ruby 
ziggeo.effectProfileProcess().create_watermark_process(effect_token_or_key, arguments = nil, file = nil) 
``` 
 
Arguments 
- file: *Image file to be attached* 
- vertical_position: *Specify the vertical position of your watermark (a value between 0.0 and 1.0)* 
- horizontal_position: *Specify the horizontal position of your watermark (a value between 0.0 and 1.0)* 
- video_scale: *Specify the image scale of your watermark (a value between 0.0 and 1.0)* 


### MetaProfiles  

The meta profiles resource allows you to access and create meta profiles for your app. Each meta profile may contain one process or more. 
 

#### Create 
 
Create a new meta profile. 

```ruby 
ziggeo.metaProfiles().create(arguments = nil) 
``` 
 
Arguments 
- key: *Meta Profile profile key.* 
- title: *Meta Profile profile title.* 


#### Index 
 
Get list of meta profiles. 

```ruby 
ziggeo.metaProfiles().index(arguments = nil) 
``` 
 
Arguments 
- limit: *Limit the number of returned meta profiles. Can be set up to 100.* 
- skip: *Skip the first [n] entries.* 
- reverse: *Reverse the order in which meta profiles are returned.* 


#### Get 
 
Get a single meta profile 

```ruby 
ziggeo.metaProfiles().get(token_or_key) 
``` 
 


#### Delete 
 
Delete the meta profile 

```ruby 
ziggeo.metaProfiles().delete(token_or_key) 
``` 
 


### MetaProfileProcess  

The process resource allows you to directly access all process associated with a single meta profile. 
 

#### Index 
 
Return all processes associated with a meta profile 

```ruby 
ziggeo.metaProfileProcess().index(meta_token_or_key) 
``` 
 


#### Get 
 
Get a single process 

```ruby 
ziggeo.metaProfileProcess().get(meta_token_or_key, token_or_key) 
``` 
 


#### Delete 
 
Delete the process 

```ruby 
ziggeo.metaProfileProcess().delete(meta_token_or_key, token_or_key) 
``` 
 


#### Create Video Analysis Process 
 
Create a new video analysis meta process 

```ruby 
ziggeo.metaProfileProcess().create_video_analysis_process(meta_token_or_key) 
``` 
 


#### Create Audio Transcription Process 
 
Create a new audio transcription meta process 

```ruby 
ziggeo.metaProfileProcess().create_audio_transcription_process(meta_token_or_key) 
``` 
 


#### Create Nsfw Process 
 
Create a new nsfw filter meta process 

```ruby 
ziggeo.metaProfileProcess().create_nsfw_process(meta_token_or_key, arguments = nil) 
``` 
 
Arguments 
- nsfw_action: *One of the following three: approve, reject, nothing.* 


### Webhooks  

The webhooks resource allows you to create or delete webhooks related to a given application. 
 

#### Create 
 
Create a new webhook for the given url to catch the given events. 

```ruby 
ziggeo.webhooks().create(arguments = nil) 
``` 
 
Arguments 
- target_url: *The url that will catch the events* 
- encoding: *Data encoding to be used by the webhook to send the events.* 
- events: *Comma-separated list of the events the webhook will catch. They must be valid webhook type events.* 


#### Confirm 
 
Confirm a webhook using its ID and the corresponding validation code. 

```ruby 
ziggeo.webhooks().confirm(arguments = nil) 
``` 
 
Arguments 
- webhook_id: *Webhook ID that's returned in the creation call.* 
- validation_code: *Validation code that is sent to the webhook when created.* 


#### Delete 
 
Delete a webhook using its URL. 

```ruby 
ziggeo.webhooks().delete(arguments = nil) 
``` 
 
Arguments 
- target_url: *The url that will catch the events* 


### Analytics  

The analytics resource allows you to access the analytics for the given application 
 

#### Get 
 
Get analytics for the given params 

```ruby 
ziggeo.analytics().get(arguments = nil) 
``` 
 
Arguments 
- from: *A UNIX timestamp in microseconds used as the start date of the query* 
- to: *A UNIX timestamp in microseconds used as the end date of the query* 
- date: *A UNIX timestamp in microseconds to retrieve data from a single date. If set, it overwrites the from and to params.* 
- query: *The query you want to run. It can be one of the following: device_views_by_os, device_views_by_date, total_plays_by_country, full_plays_by_country, total_plays_by_hour, full_plays_by_hour, total_plays_by_browser, full_plays_by_browser* 





## License

Copyright (c) 2013-2019 Ziggeo
 
Apache 2.0 License
