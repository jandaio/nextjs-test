import MainMenu from "./clientComponents/mainMenu"

export const metadata = {
  title: 'Test the next.js',
  description: 'Testeando next',
}


export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>

        <MainMenu></MainMenu>
        {children}

      </body>
    </html>
  )
}
