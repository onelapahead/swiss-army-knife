## swiss-army-knife

Lots of images exist individually for each tool I wanted... so I
just copied their `apk` packages and put it into one image.

Feel free to add more.

### Usage

Create a Pod named `debug` in your desired namespace:

```bash
$ kubectl run -i -t --image=brix4dayz/swiss-army-knife --restart=Never debug -n <namespace>
```

Happy debugging!
