const UglifyJSPlugin = require('uglifyjs-webpack-plugin')
const CopyWebPackPlugin = require('copy-webpack-plugin')
// const WebpackShellPlugin = require('webpack-shell-plugin')

module.exports = {
    entry: {
        background: "./src/background.ts",
        content: "./src/content.ts",
        commandline_frame: "./src/commandline_frame.ts",
    },
    output: {
        filename: "[name].js",
        path: __dirname + "/build"
    },

    // Enable sourcemaps for debugging webpack's output.
    devtool: "inline-source-map",

    resolve: {
        // Add '.ts' and '.tsx' as resolvable extensions.
        // added CSS here as a guess
        extensions: [".ts", ".tsx", ".js", ".json", ".css"]
    },

    module: {
        rules: [
            // All files with a '.ts' or '.tsx' extension will be handled by 'awesome-typescript-loader'.
            { test: /\.tsx?$/, loader: "awesome-typescript-loader" },

            // as suggested by https://stackoverflow.com/questions/33257497/codemirror-does-not-working-with-react-webpack
            { test: /\.css$/, loader: ['style-loader','css-loader'] },

            // All output '.js' files will have any sourcemaps re-processed by 'source-map-loader'.
            { enforce: "pre", test: /\.js$/, loader: "source-map-loader" }
        ]
    },

    plugins: [
        // new UglifyJSPlugin({
        //     uglifyOptions: {
        //         ecma: 8
        //     }
        // }),
        // new WebpackShellPlugin({onBuildStart: [
        //     'mkdir -p generated/static',
        //     'scripts/excmds_macros.py',
        //     'scripts/newtab.md.sh',
        //     'scripts/make_docs.sh',
        // ]}),
        new CopyWebPackPlugin([
            { from: "src/manifest.json" },
            { from: "src/static", to: "static", ignore: ['*.psd', '*1024px.png'] },
            { from: "generated/static", to: "static" },
        ]),
    ]
}
