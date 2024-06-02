# Today I Learned 20240531

## Xpath

Yeah, I'm not a webdev guy, okay.
Also, I was initially not impressed by this `jq` but for XML thing (yes, I know Xpath was first, but I ~~know~~ use `jq` and it's pretty powerful).
I couldn't get `xpath` (the one written in Perl) to output just a key or attribute's value without the whole node or whatnot.
You wrap your query in `string(...)` and it works.
So, that's fine I guess, but `grep` and `cut` also served to solve the specific use-case I was working on and not be too horrible.
It would work better for this other XML parsing mess I've got though...
