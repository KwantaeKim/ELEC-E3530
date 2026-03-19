procedure(cohsamp(fin Fs N)
  let((x primes M bestDist)
    x = ceiling(N * fin / Fs)
    primes = nil
    for(n 2 x*2
      let((isPrime)
        isPrime = t
        for(i 2 n-1
          when(mod(n i) == 0
            isPrime = nil
          )
        )
        when(isPrime
          primes = append1(primes n)
        )
      )
    )
    M = car(primes)
    bestDist = abs(M - x)
    foreach(p primes
      when(abs(p - x) < bestDist
        bestDist = abs(p - x)
        M = p
      )
    )
    printf("Coherent fin = %g Hz (M=%d, N=%d)\n" Fs*M/N M N)
    Fs * M / N
  )
)