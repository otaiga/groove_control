#Groove API
class Groove

  def run(query)
    return unless !query.to_s.empty?
    result = process_info(query.to_s)
  end

private

  def process_info(query)
    return unless query
    response = HTTParty.get(build_query_string(query))
    if JSON.parse(response).empty?
      return nil
    else
      return processed_info(response)
    end
  end

  def processed_info(response)
    return unless response
    JSON.parse(response)["SongID"]
  end

  def build_query_string(query)
    return unless query
    info_api_path + api_formatted(query) + format + key
  end

  def api_formatted(query)
    return unless query
    query.gsub(" ", "+")
  end

  def api_key
    Rails.application.config.groove_shark_api
  end

  def info_api_path
    "http://tinysong.com/b/"
  end

  def format
    "?format=json"
  end

  def key
    "&key=#{api_key}"
  end
end