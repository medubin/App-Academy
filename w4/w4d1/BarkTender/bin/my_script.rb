require 'addressable/uri'
require 'rest-client'
  #
  # url = Addressable::URI.new(
  #   scheme: 'http',
  #   host: 'localhost',
  #   port: 3000,
  #   path: '/users.json',
  #   query_values: {
  #     'some_category[a_key]' => 'another value',
  #     'some_category[a_second_key]' => 'yet another value',
  #     'some_category[inner_inner_hash][key]' => 'value',
  #     'something_else' => 'aaahhhhh'
  #   }
  # ).to_s
  #
  # puts RestClient.get(url)
  #

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: "Gizmo", email: "gizmo@gizmo.gizmo" } }
  )
end

def create_user_exception
  begin
    create_user
  rescue RestClient::Exception
    raise StandardError
  end

end

#
def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{ARGV[0]}.json"
  ).to_s

  puts RestClient.patch(
    url,
    { user: { name: "Bobo", }} #email: "gizmo@gizmo.gizmo" } }
  )
end

# create_user_exception
# update_user


def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{ARGV[0]}.json"
  ).to_s

  puts RestClient.delete url
end

destroy_user


def destroy_contact_shares
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/contact_shares/#{ARGV[0]}.json"
  ).to_s

  puts RestClient.delete url
end
# destroy_contact_shares
