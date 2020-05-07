# OVERVIEW

This app is about making short links, collecting user information, and generating some reports.

## Architecture

The system accepts a full link and a short desired link(optional) and returns a shorted in response. As I wanted to have a simple and high-efficient clustered index, I convert the short URL(as it always should be unique) into an integer via the bijective algorithm.
I've developed a reporting system which gives us an opportunity to export them in any format as you want.
The information collecting is happening in the background and I did not pay any attention to it(I like the idea which brings up by wisper gem)

## Thoughts

I tried to follow OOP principles but still see that the Strategy pattern and the desire/experiment to make ruby more static language is decreasing the readability of the code. Some of my thoughts are in the comments. 

### Enjoy!.. And feel free to ask any questions or provide enhancements. I am ready to discuss 
