/// Enum class list all possible networking error
enum NetworkError {
  //Device is not connected to any network
  NO_NETWORK_ERROR,
  //Device is connected to any network but Network stack throws {@link ConnectionException}
  CONNECTION_ERROR,
  //Web Service Call response is not 200
  HTTP_ERROR,
  //Web Service Call response is 200 but error in json
  SERVER_ERROR,
  //Web Service Call response is 200 but error in json
  INVALID_JSON_ERROR,
  //Unknown Error
  UNKNOWN_ERROR
}
