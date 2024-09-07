#' Elian Mugerli 6.9.2024
#' # Matematično nihalo
#' 
#' 

using .Domaca03

#' ## Opis problema
#' Kotni odmik θ(t) (v radianih) pri nedušenem nihanju nitnega nihala opišemo z diferencialno enačbo
#'
#' glsin(θ(t))+θ′′(t)=0,θ(0)=θ0, θ′(0)=θ′0,
#'
#' kjer je g pospešek prostega pada, l dolžina niti, θ0 začetni odmik (v radianih) in θ′0 začetna kotna hitrost.

#' Enačbo drugega reda prevedemo na sistem prvega reda in dobimo:
#' $\theta^{\prime}(t) = v(t)$
#' 
#' $v^{\prime}(t) = -\frac{g}{l} \sin(\theta(t))$
# Parametri nihala
l = 100.0       # dolžina nihala
t = 10.0      # čas simulacije
theta0 = 1.0  # začetni odmik (v radianih)
dtheta0 = 0.0 # začetna kotna hitrost
n = 100      # število korakov

odmik = nihalo(l, t, theta0, dtheta0, n)
#' ## Rešitev podanega problema
#' Izračunaj odmike in hitrosti za tako matematično kot tudi harmonično nihalo.
odmiki_matematicno, hitrosti_matematicno = nihalo_extended(1.0, t, 1.0, 1.0, n, 1)
odmiki_harmonicno, hitrosti_harmonicno = nihalo_extended(1.0, t, 1.0, 1.0, n, 2)

velikost = range(0, stop=t, length=n+1)

#' ## Grafični prikaz
#' Spodaj je prikazan graf, ki predstavlja, kako se nihajni čas spreminja z energijo nihala.
using Plots
p = plot(velikost, hitrosti_matematicno, xlabel="Čas (s)", ylabel="Energija", title="Matematično in Harmonično nihalo", label="Matematično nihalo")
plot!(p, velikost, hitrosti_harmonicno, label="Harmonično nihalo")
savefig("assets/energija_nihala.png")
display(p)

#' Sledi še primerjava odmikov nihal.
p = plot(velikost, odmiki_matematicno, xlabel="Čas (s)", ylabel="Odmik (rad)", title="Matematično in Harmonično nihalo", label="Matematično nihalo")
plot!(p, velikost, odmiki_harmonicno, label="Harmonično nihalo")
savefig("assets/odmiki_nihala.png")
display(p)