const path = require('path');
const HtmlWebPackPlugin = require("html-webpack-plugin");
const ModuleFederationPlugin = require("webpack/lib/container/ModuleFederationPlugin");
const webpack = require("webpack");


const packageJsonDeps = require("./package.json").dependencies;
module.exports = {
  output: {
    publicPath: "http://localhost:3002/",
  },

  resolve: {
    extensions: [".tsx", ".ts", ".jsx", ".js", ".json"],
  },

  // entry: {
  //   app: './src/index.js',
  //   exportPage: './src/ExportPage.tsx',
  //   // Runtime code for hot module replacement
  //   hot: 'webpack/hot/dev-server.js',
  //   // Dev server client for web socket transport, hot and live reload logic
  //   client: 'webpack-dev-server/client/index.js?hot=true&live-reload=true',
  // },

  devServer: {
    port: 3002,
    historyApiFallback: true,
    https: false,
    allowedHosts: [
      'localhost:8080',
    ],
    // hot: false,
    // client: false,
    // client: {
    //   webSocketURL: 'ws://localhost:9000/page/ws'
    // },
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
      "Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization"
    },
    client: {
      progress: true,
      reconnect: true,
      
      logging: 'info',
      webSocketTransport: 'ws',
    },
    webSocketServer: 'ws',
  },

  module: {
    rules: [
      {
        test: /\.m?js/,
        type: "javascript/auto",
        resolve: {
          fullySpecified: false,
        },
      },
      {
        test: /\.(css|s[ac]ss)$/i,
        use: ["style-loader", "css-loader", "postcss-loader"],
      },
      {
        test: /\.(ts|tsx|js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
        },
      },
    ],
  },

  plugins: [
    // Plugin for hot module replacement
    // new webpack.HotModuleReplacementPlugin(),
    new ModuleFederationPlugin({
      name: "pages",
      filename: "remoteEntry.js",
      remotes: {},
      exposes: {
        "./Page": "./src/ExportPage.tsx",
        "./Recipes": "./src/Recipes.tsx",
        "./Recipe": "./src/Recipe.tsx",
      },
      shared: {
        ...packageJsonDeps,
        react: {
          singleton: true,
          // requiredVersion: deps.react,
          eager: true, requiredVersion: packageJsonDeps.react
        },
        "react-dom": {
          singleton: true,
          // requiredVersion: deps["react-dom"],
          eager: true, requiredVersion: packageJsonDeps["react-dom"]
        },
      },
    }),
    new HtmlWebPackPlugin({
      template: "./src/index.html",
    }),
  ],
};
