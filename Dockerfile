FROM mcr.microsoft.com/dotnet/sdk:9.0-alpine AS build

EXPOSE 5000
EXPOSE 80
EXPOSE 443
WORKDIR /app
COPY . ./
RUN dotnet restore
RUN dotnet build -c Release
RUN dotnet publish --runtime linux-arm64 -c Release --self-contained -o /out

# Use the official .NET runtime image for the runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:9.0-alpine AS runtime

# Set the working directory in the container
WORKDIR /app

# Copy the published output from the build stage
COPY --from=build /out .

# Expose the port that the app will run on (e.g., 80 for a web application)
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["dotnet", "Sales.Backend.Api.dll"]