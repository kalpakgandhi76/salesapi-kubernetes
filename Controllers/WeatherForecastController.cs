using Microsoft.AspNetCore.Mvc;
using Stackup.Api.Service;

namespace Stackup.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class WeatherForecastController : ControllerBase
{


    private readonly ILogger<WeatherForecastController> _logger;
    IWeatherService _service;

    /// <summary>
    /// Weather Controller
    /// </summary>
    /// <param name="logger">The Logger</param>
    /// <param name="service">The Service</param>
    public WeatherForecastController(ILogger<WeatherForecastController> logger, IWeatherService service)
    {
        _logger = logger;
        _service = service;
    }

    [HttpGet(Name = "GetWeatherForecast")]
    public IEnumerable<WeatherForecast> Get()
    {
       return  _service.GetWeather();
    }
}
