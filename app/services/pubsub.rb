# class Pubsub
#   PING_INTERVAL = 10
#
#   class Subscription < Struct.new(:key, :socket, :operation, :params, :timer)
#     def safe_write
#       # if socket.closed?
#       #   puts "Client disconnected, closing socket..."
#       #   unwatch(key_to_watch)
#       #   socket.close
#       # else
#       #   socket.write("\n") rescue binding.pry
#       #   socket.flush
#       # end
#     rescue
#       puts $!
#     end
#
#     def cancel
#       cancel_proc.call
#     end
#   end
#
#   def initialize
#     @mutex = Thread::Mutex.new
#     Thread.new do
#       Thread.current.abort_on_exception = true
#       EventMachine.run do
#         @channel.subscribe do |msg|
#           puts msg, " = ", msg.object_id
#         end
#         @redis = EM::Hiredis.connect
#       end
#     end
#   end
#
#   def publish(key, payload = "")
#     @redis.publish(key, payload)
#   end
#
#   def subscribe(key, &block)
#     @redis.pubsub.subscribe(key, &block)
#   end
#
#   def unsubscribe(key)
#     @redis.pubsub.unsubscribe(key)
#   end
#
#   def add_subscription(subscription)
#     @mutex.synchronized do
#       (subscriptions[subscription.key] ||= Set.new) << subscription
#     end
#   end
#
#   def remove_subscription(subscription)
#     @mutex.synchronized do
#       subscriptions[subscription.key].delete(subscription)
#       subscriptions.delete(subscription.key) if subscriptions[subscription.key].blank?
#     end
#   end
#
#   def sse_stream(key, socket, operation, params = {})
#     subscription = Subscription.new(key, socket, operation, params, nil)
#
#     subscription.timer = EventMachine::PeriodicTimer.new(PING_INTERVAL) do
#       safe_write(subscription, "\n")
#     end
#
#     # Initially
#     op = Applicationkey.connection_pool.with_connection do
#       operation.(params)
#     end
#
#     # On every change...
#     subscribe key do
#       send_msg(socket, operation, params) unless socket.closed?
#     end
#   end
#
#   private
#
#   def subscriptions
#     @subscriptions ||= {}
#   end
#
#   def safe_write(subscription, data)
#     socket.write("data: #{data.to_json}\n\n")
#     socket.flush
#   rescue
#     puts $!
#
#   end
#
#   def send_msg(subscription, operation, params)
#     op = Applicationkey.connection_pool.with_connection do
#       operation.(params)
#     end
#     safe_write(subscription, op)
#   end
# end
#
#
#
# # class Pubsub
# #   class Subscription < Struct.new(:key, :thread, :callback)
# #   end
# #
# #   def initialize
# #     @subscriptions = ThreadSafe::Array.new
# #     @listener = Listener.new(Applicationkey.connection.raw_connection)
# #     @listener.listen :changes do |channel, pid, payload|
# #       handle_notification(payload) rescue handle_error($!)
# #     end
# #     at_exit { @listener.stop }
# #   end
# #
# #   def notify(key)
# #     Applicationkey.connection.execute "NOTIFY changes, '#{key_key(key)}'"
# #   end
# #
# #   def watch(key, &block)
# #     key = key_key(key)
# #     @subscriptions << Subscription.new(key, Thread.current, block.to_proc)
# #   end
# #
# #   def unwatch(key)
# #     key = key_key(key)
# #     @subscriptions.delete_if {|sub| sub.thread == Thread.current && sub.key == key}
# #   end
# #
# #   private
# #
# #   def key_key(key)
# #     "#{key.class.name}/#{key.id}"
# #   end
# #
# #   def handle_notification(payload)
# #     @subscriptions.each do |sub|
# #       sub.callback.call if sub.key == payload
# #     end
# #   end
# #
# #   def handle_error(exception)
# #     STDERR.puts exception
# #   end
# # end
