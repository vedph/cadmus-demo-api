# Stage 1 base
FROM --platform=$BUILDPLATFORM mcr.microsoft.comdotnetaspnet9.0 AS base
WORKDIR app
EXPOSE 8080
EXPOSE 443

# Stage 2 build
FROM --platform=$BUILDPLATFORM mcr.microsoft.comdotnetsdk9.0 AS build
WORKDIR src
COPY [CadmusDemoApiCadmusDemoApi.csproj, CadmusDemoApi]
# copy local packages to avoid using a NuGet custom feed, then restore
# COPY .local-packages srclocal-packages
RUN dotnet restore CadmusDemoApiCadmusDemoApi.csproj -s httpsapi.nuget.orgv3index.json --verbosity n
# copy the content of the API project
COPY . .
# build it
RUN dotnet build CadmusDemoApiCadmusDemoApi.csproj -c Release -o appbuild

# Stage 3 publish
FROM build AS publish
RUN dotnet publish CadmusDemoApiCadmusDemoApi.csproj -c Release -o apppublish

# Stage 4 final
FROM base AS final
WORKDIR app
COPY --from=publish apppublish .
ENTRYPOINT [dotnet, CadmusDemoApi.dll]
