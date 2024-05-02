---
title: Discord
icon: material/message-text
---

# Discord

## External tools

- [Chat Exporter](https://github.com/Tyrrrz/DiscordChatExporter)
- [CustomRP](https://www.customrp.xyz)
- [Emoji Downloader](https://thatiemsz.github.io/Discord-Emoji-Downloader)
- [RPC Maker](https://drpcm.t1c.dev)

## Markdown syntax

Discord supports standard Markdown syntax such as

- Header : `# Header`
- _Italics_: `*italics*` or `_italics_`
- **Bold**: `**bold**`
- ~~Strikethrough~~: `~~Strikethrough~~`
- Masked links: `[This is my wiki](https://loicreynier.github.io/wiki)`
- Quote: `> Quoted text`

Additionally, custom syntaxes are provided:

- Multi-line block quote:

  ```text
  >>> All the message
  will be included in the quote.
  ```

- Spoiler tags:

  ```text

  @everyone please do not look at this
  ||hidden text||
  ```

## File sharing

### HEVC MP4 Embedding

As of January 2024,
Discord currently faces an issue
where it does not embed MP4 video files encoded with HEVC.
To get around this issue,
consider converting HEVC-encoded videos to more widely supported codecs,
such as a H.264,
until Discord potentially addresses this limitation in future updates.

To convert a HEVC-encoded MP4 video file to the H.264 codec
using FFmpeg in the command line,
one can use the command

```shell
ffmpeg -i input_file.hevc.mp4 \
    -c:v libx264 -crf 23 \
    -strict experimental \
    -c:a aac -b:a 192k \
    output_file.h264.mp4
```

where

- `-c:v libx264`:
  Sets the video codec to `libx264`,
  which is the H.264 codec.
- `-crf 23`: Controls the quality of the output.
  Lower values result in higher quality but larger file sizes.
  A good range is typically 18-28.
- `-c:a aac`:
  Sets the audio codec to AAC.
- `-strict experimental`:
  Allows the use of experimental codecs,
  required for certain audio codecs like AAC.
- `-b:a 192k`: Sets the audio bitrate to 192 kbps.
