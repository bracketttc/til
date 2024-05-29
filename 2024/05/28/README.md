# Today I Learned 20240528

## ELF Constructors and Destructors

Alright, I knew a little about them already, but I learned more.
This comes thanks to a little [grousing][grousing-toot] by [Lennart Poettering][pid_eins], best(?) known for his work on systemd, about things he considers red flags in a C or C++ codebase.
So, these things get called in the order that the respective libraries get loaded in.
But you don't necessarily control what order your libraries load in.

## Negative Results are Still Results

I like JFrog's Artifactory.
It's a pretty decent binary artifact storage system.
I mean, it's the one that I got my employer to use anyway.
So, it was with some frustration today that I tried -- and failed -- to do some pretty basic repository snapshotting and Artifactory wouldn't.

Let's step back a bit.
One of the most basic ways to maintain control of an external set of repositories is to just `rsync` it.
Or switch to `rsnapshot` and only store files once.
So, Artifactory should be able to do something similar, yeah?
It claims to.
There's an [API endpoint](https://jfrog.com/help/r/jfrog-rest-apis/folder-sync-deprecated) to sync a (subtree of a) remote repository, but it's deprecated.
And it gives me a 404.

I didn't stop there.
I poked around trying to recreate it with an execution plugin.
I wasted a few hours on that.
It doesn't seem possible to sync a remote repository from within the service.
That's a shame.
I would have liked to save the bandwidth within the network.

But, hey, learning that something doesn't work is still learning.

[grousing-toot]: https://mastodon.social/@pid_eins/112517967148247923
[pid_eins]: https://0pointer.net/blog/
