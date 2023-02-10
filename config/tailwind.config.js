const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        pacifico: ['Pacifico', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        blue: '#0081C9',
        blueD: 'hsl(201, 100%, 30%)',
        blueL: '#86E5FF',
        blueM: '#5BC0F8',
        yellow: 'hsl(43, 100%, 62%)',
        yellowL: 'hsl(43, 95%, 68%)',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
