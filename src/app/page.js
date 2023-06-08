import Image from 'next/image'

export default function Home() {
  return (
    <main>

      <div>
        <Image
          src="/images/logoMarlewEn.png"
          alt="Marlew logo"
          width={1668 / 2}
          height={451 / 2}
          priority
        />
      </div>



    </main>
  )
}
