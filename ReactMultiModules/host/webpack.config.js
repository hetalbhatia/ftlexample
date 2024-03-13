const HtmlWebPackPlugin = require("html-webpack-plugin");
const ModuleFederationPlugin = require("webpack/lib/container/ModuleFederationPlugin");
const TerserPlugin = require("terser-webpack-plugin");
const packageJsonDeps = require("./package.json").dependencies;
module.exports = {
  // optimization: {
  //   minimize: true,
  //   minimizer: [new TerserPlugin()],
  // },
  output: {
    publicPath: "http://localhost:3000/",
  },

  resolve: {
    extensions: [".tsx", ".ts", ".jsx", ".js", ".json"],
  },

  devServer: {
    port: 3000,
    historyApiFallback: true,
    https: false,
    compress: true,
    allowedHosts: [
      'localhost:8080',
    ],
    // client: {
    //   webSocketURL: 'ws://localhost:9000/host/ws'
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
      overlay: {
        errors: true,
        warnings: false,
        runtimeErrors: true,
      },
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
    new ModuleFederationPlugin({
      name: "host",
      filename: "remoteEntry.js",
      remotes: {
        layout: "layout@http://localhost:3001/remoteEntry.js",
        pages: "pages@http://localhost:3002/remoteEntry.js",
      },
      exposes: {
        "./OneApp": "./src/OneApp.tsx",
        "./HostApp": "./src/HostApp.tsx",
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
