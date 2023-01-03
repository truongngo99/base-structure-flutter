class Utils {
  static String handleErrorGrpc(String statusCode) {
    String error = "";
    switch (statusCode) {
      case "1":
        error = "The operation was cancelled";
        break;
      case "2":
        error = "The operation was cancelled";
        break;
      case "3":
        error = "INVALID_ARGUMENT";
        break;
      case "4":
        error = "DEADLINE_EXCEEDED";
        break;
      case "5":
        error = "NOT_FOUND";
        break;
      case "6":
        error = "ALREADY_EXISTS";
        break;
      case "7":
        error = "PERMISSION_DENIED";
        break;
      case "8":
        error = "RESOURCE_EXHAUSTED";
        break;
      case "9":
        error = "FAILED_PRECONDITION";
        break;
      case "10":
        error = "ABORTED";
        break;
      case "11":
        error = "OUT_OF_RANGE";
        break;
      case "12":
        error = "UNIMPLEMENTED";
        break;
      case "13":
        error = "INTERNAL";
        break;
      case "14":
        error = "SocketException";
        break;
      case "15":
        error = "DATA_LOSS";
        break;
      default:
        error = "UNAUTHENTICATED";
    }
    return error;
  }
}
