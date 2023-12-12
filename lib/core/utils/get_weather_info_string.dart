class GetWeatherInfoText {
  static String getWeatherInfo(int code, bool isDay) {
    String weatherInfo = '';

    switch (code) {
      case 1000:
        weatherInfo = 'Sunny, Clear';
        break;
      case 1003:
        weatherInfo = 'Partly cloudy, Partly cloudy';
        break;
      case 1006:
        weatherInfo = 'Cloudy, Cloudy';
        break;
      case 1009:
        weatherInfo = 'Overcast, Overcast';
        break;
      case 1030:
        weatherInfo = 'Mist, Mist';
        break;
      case 1063:
        weatherInfo = 'Patchy rain possible, Patchy rain possible';
        break;
      case 1066:
        weatherInfo = 'Patchy snow possible, Patchy snow possible';
        break;
      case 1069:
        weatherInfo = 'Patchy sleet possible, Patchy sleet possible';
        break;
      case 1072:
        weatherInfo =
            'Patchy freezing drizzle possible, Patchy freezing drizzle possible';
        break;
      case 1087:
        weatherInfo =
            'Thundery outbreaks possible, Thundery outbreaks possible';
        break;
      case 1114:
        weatherInfo = 'Blowing snow, Blowing snow';
        break;
      case 1117:
        weatherInfo = 'Blizzard, Blizzard';
        break;
      case 1135:
        weatherInfo = 'Fog, Fog';
        break;
      case 1147:
        weatherInfo = 'Freezing fog, Freezing fog';
        break;
      case 1150:
        weatherInfo = 'Patchy light drizzle, Patchy light drizzle';
        break;
      case 1153:
        weatherInfo = 'Light drizzle, Light drizzle';
        break;
      case 1168:
        weatherInfo = 'Freezing drizzle, Freezing drizzle';
        break;
      case 1171:
        weatherInfo = 'Heavy freezing drizzle, Heavy freezing drizzle';
        break;
      case 1180:
        weatherInfo = 'Patchy light rain, Patchy light rain';
        break;
      case 1183:
        weatherInfo = 'Light rain, Light rain';
        break;
      case 1186:
        weatherInfo = 'Moderate rain at times, Moderate rain at times';
        break;
      case 1189:
        weatherInfo = 'Moderate rain, Moderate rain';
        break;
      case 1192:
        weatherInfo = 'Heavy rain at times, Heavy rain at times';
        break;
      case 1195:
        weatherInfo = 'Heavy rain, Heavy rain';
        break;
      case 1198:
        weatherInfo = 'Light freezing rain, Light freezing rain';
        break;
      case 1201:
        weatherInfo =
            'Moderate or heavy freezing rain, Moderate or heavy freezing rain';
        break;
      case 1204:
        weatherInfo = 'Light sleet, Light sleet';
        break;
      case 1207:
        weatherInfo = 'Moderate or heavy sleet, Moderate or heavy sleet';
        break;
      case 1210:
        weatherInfo = 'Patchy light snow, Patchy light snow';
        break;
      case 1213:
        weatherInfo = 'Light snow, Light snow';
        break;
      case 1216:
        weatherInfo = 'Patchy moderate snow, Patchy moderate snow';
        break;
      case 1219:
        weatherInfo = 'Moderate snow, Moderate snow';
        break;
      case 1222:
        weatherInfo = 'Patchy heavy snow, Patchy heavy snow';
        break;
      case 1225:
        weatherInfo = 'Heavy snow, Heavy snow';
        break;
      case 1237:
        weatherInfo = 'Ice pellets, Ice pellets';
        break;
      case 1240:
        weatherInfo = 'Light rain shower, Light rain shower';
        break;
      case 1243:
        weatherInfo =
            'Moderate or heavy rain shower, Moderate or heavy rain shower';
        break;
      case 1246:
        weatherInfo = 'Torrential rain shower, Torrential rain shower';
        break;
      case 1249:
        weatherInfo = 'Light sleet showers, Light sleet showers';
        break;
      case 1252:
        weatherInfo =
            'Moderate or heavy sleet showers, Moderate or heavy sleet showers';
        break;
      case 1255:
        weatherInfo = 'Light snow showers, Light snow showers';
        break;
      case 1258:
        weatherInfo =
            'Moderate or heavy snow showers, Moderate or heavy snow showers';
        break;
      case 1261:
        weatherInfo =
            'Light showers of ice pellets, Light showers of ice pellets';
        break;
      case 1264:
        weatherInfo =
            'Moderate or heavy showers of ice pellets, Moderate or heavy showers of ice pellets';
        break;
      case 1273:
        weatherInfo =
            'Patchy light rain with thunder, Patchy light rain with thunder';
        break;
      case 1276:
        weatherInfo =
            'Moderate or heavy rain with thunder, Moderate or heavy rain with thunder';
        break;
      case 1279:
        weatherInfo =
            'Patchy light snow with thunder, Patchy light snow with thunder';
        break;
      case 1282:
        weatherInfo =
            'Moderate or heavy snow with thunder, Moderate or heavy snow with thunder';
        break;
      default:
        weatherInfo = 'Unknown code';
    }

    if (isDay) {
      return weatherInfo.split(',').first;
    } else {
      return weatherInfo.split(',').last;
    }
  }
}
