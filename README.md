# dotfiles
personal dotfile configuration

## hs - Hammerspoon Scripts
Collection of Lua scripts used to automate everyday MacOS functionalities.

### Rails Console Clipper
Senses when text is copied from a `rails console/irb` terminal text output and formats the copied text into an executable Ruby snippet when you paste.

For example, copying this text straight from terminal output:

```
irb(main):079:0> class FakeClient
irb(main):080:1>   def initialize(uri:, key:)
irb(main):081:2>     @uri = uri
irb(main):082:2>     @key = key
irb(main):083:2>   end
irb(main):084:1>
irb(main):085:1>   def get
irb(main):086:2>     ['important', 'stuff', 'no', 'seriously', 'it', 'is']
irb(main):087:2>   end
irb(main):088:1> end
=> :get
irb(main):089:0> class MyTestClass
irb(main):090:1>   def initialize(fake_uri, fake_key)
irb(main):091:2>     @fake_uri = fake_uri
irb(main):092:2>     @fake_key = fake_key
irb(main):093:2>   end
irb(main):094:1>
irb(main):095:1>   def fake_api_client
irb(main):096:2>     @fake_client ||= FakeClient.new(
irb(main):097:3*       :uri => @fake_uri,
irb(main):098:3*       :key => @fake_key
irb(main):099:3>     )
irb(main):100:2>   end
irb(main):101:1> end
=> :fake_api_client
irb(main):102:0> test_obj = MyTestClass.new('http://127.0.0.1', 'bunchafakestuffforthekey')
=> #<MyTestClass:0x00005630100d6150 @fake_uri="http://127.0.0.1", @fake_key="bunchafakestuffforthekey">
irb(main):103:0> result = test_obj.fake_api_client.get
=> ["important", "stuff", "no", "seriously", "it", "is"]
irb(main):104:0> pp result
["important", "stuff", "no", "seriously", "it", "is"]
=> ["important", "stuff", "no", "seriously", "it", "is"]
```

Gets transformed into this fully-executable Ruby snippet:

```ruby
class FakeClient
  def initialize(uri:, key:)
    @uri = uri
    @key = key
  end

  def get
    ['important', 'stuff', 'no', 'seriously', 'it', 'is']
  end
end
# => :get
class MyTestClass
  def initialize(fake_uri, fake_key)
    @fake_uri = fake_uri
    @fake_key = fake_key
  end

  def fake_api_client
    @fake_client ||= FakeClient.new(
      :uri => @fake_uri,
      :key => @fake_key
    )
  end
end
# => :fake_api_client
test_obj = MyTestClass.new('http://127.0.0.1', 'bunchafakestuffforthekey')
# => #<MyTestClass:0x00005630100d6150 @fake_uri="http://127.0.0.1", @fake_key="bunchafakestuffforthekey">
result = test_obj.fake_api_client.get
# => ["important", "stuff", "no", "seriously", "it", "is"]
pp result
# ["important", "stuff", "no", "seriously", "it", "is"]
# => ["important", "stuff", "no", "seriously", "it", "is"]
```

**Limits**
- Copied payload must start with `irb(*):*:*[>*]` pattern on the first non-empty line of text, otherwise the payload will not be transformed. This is designed to not waste processing time on payloads that might not have any `irb` output in them.
- Temporary disabling of the payload transform is only possible by running `pasteboardWatcher:stop()` in the Hammerspoon Console; restarting is triggered with `pasteboardWatcher:start()`.


