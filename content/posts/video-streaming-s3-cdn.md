---
title: 'A note on MP4 streaming, S3 and CDN'
draft: false
tags: [technical]
showTags: true
date: 2025-01-04T22:24:00+07:00
summary: "Just some personal takeaways after an interesting course"
description: "Just some personal takeaways after an interesting course"
readTime: true
autonumber: true
---

This is my personal takeaways from the course [Learn File Servers and CDNs with S3 and CloudFront](https://www.boot.dev/courses/learn-file-servers-s3-cloudfront-golang) from Boot.dev

# Streaming MP4 Videos

When a browser sees the video tag, it will try to stream the video by default. Streaming will be enabled automatically if the server supports it.

Each .mp4 video has a piece of data called the "moov atom," which contains metadata required for playing the video, such as track information and timing. However, by default, this piece of data is at the end of the video. This is mainly because the encoding process just appends the data to the final file, and the data in the moov atom can only be fully created when the full file is processed. So, in order for streaming to work, the browser will need a way to get the moov atom. Initially, the browser requests the video and quickly stops to determine the video's total size. Then, with the known size, the browser will make another request, with the Range header set to the end of the video, to get the moov atom. Only after those two requests can the browser stream the video.

As backend developers, we can help the streaming process by transcoding the .mp4 file to bring the moov atom to the beginning ourselves. This can be done with the help of `ffmpeg`:

```
ffmpeg -i input.mp4 -c copy -movflags +faststart output.mp4
```

MP4 files on their own do not support adaptive bitrate streaming, which allows the video quality to adjust dynamically based on the viewer's internet connection speed. To support adaptive streaming, we will need to use formats such as HLS or MPEG-DASH. These formats break the video into smaller segments and provide a manifest file (such as `.m3u8` for HLS) to provide the video player with information about the different segments with different bitrates. This allows the player to dynamically adjust the video quality based on the viewer's internet connection speed.

# S3

The main differences between an object file storage and a file system are:

- Although the "name" of the file in an object file storage looks like paths, and the UI shows it as the file system, the object file storage does not have a hierarchy with directories like the file system. All files are flat, and the "name" (with or without `/`) is the key of the file itself.
- In a file system, the metadata about the file, such as permission, size, date created, etc., is stored by the file system, while in a blob storage, those data are enclosed in the "object" itself.

To protect the privacy of personal data of users, we should set all the data in the bucket to private, and use our own server to check accessibility of each request and only give pre-signed URLs to the authorized requesters.

# CDN

To enhance the security of the blob storage (S3) and utilize caching, we put our object storage behind a CDN. AWS has CloudFront for this purpose.

When set up with proper security policies, all requests to the object file storage that do not originate from the CDN will be blocked. In other words, the requests for the files will be forced to go through the CDN. This will enforce security and ensure content is served efficiently.
