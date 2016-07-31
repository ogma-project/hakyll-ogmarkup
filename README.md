# Hakyll + ogmarkup

With the module, you can use the ogmarkup language to write your stories and
Hakyll to publish them.

For instance, one can add the following lines (considering HakyllConf is a valid
ogmarkup configuration which has been defined elsewere, see [ogmarkup
configuration](https://hackage.haskell.org/package/ogmarkup-2.1/docs/Text-Ogmarkup.html#t:GenConf)
for additional information):

```haskell
    match "w/*" $ do
        route $ setExtension "html"
        compile $ ogmarkupCompile HakyllConf
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls
```
