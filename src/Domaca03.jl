module Domaca03

export nihalo, runge_kutta4, nihalo_extended

"""
    Metoda za računanje kotnih odmikov nihala podanega matematičnega nihala s pomočjo metore Runge-Kutta 4.stopnje
    Vhodni parametri:
    - `l` je dolžina nihala
    - `t` je čas simulacije
    - `theta0` je začetni odmik
    - `dtheta0` je začetna kotna hitrost
"""
function nihalo(l, t, theta0, dtheta0, n)
    g = 9.80665 
    h = t/n
    y = [theta0, dtheta0]

    function f(t,th)
        return [th, -(g / l) * sin(t)]
    end

    for i in 1:n
        yn = runge_kutta4(y[1],y[2], h, f)
        y += yn
    end

    return y[1]
end

"""
    Metoda za izračun kotnih odmikov in hitrosti nihala podanega matematičnega/harmoničnega nihala s pomočjo metode Runge-Kutta 4.stopnje
"""
function nihalo_extended(l, t, theta0, dtheta0, n, tip_nihala=1)
    g = 9.80665 
    h = t/n
    dy1 = [theta0]
    dy2 = [dtheta0]

    # Prilagajamo funkcijo glede na tip nihala
    function f(t,th)
        if tip_nihala == 1
            return [th, -(g / l) * sin(t)]
        else
            return [th, -(g / l) * t]
        end
    end

    for i in 1:n
        yn = runge_kutta4(dy1[i], dy2[i], h, f)
        push!(dy1, yn[1] + dy1[i])
        push!(dy2, yn[2] + dy2[i])
    end

    return (dy1, dy2)
end

"""
    Metoda Runge-Kutta 4. stopnje za reševanje sistema diferencialnih enačb.
"""
function runge_kutta4(t, th, h, f)
    k1 = h * f(t, th)
    k2 = h * f(t + k1[1] / 2, th + k1[2] / 2)
    k3 = h * f(t + k2[1] / 2, th + k2[2] / 2)
    k4 = h * f(t + k3[1], th + k3[2])
    tn = (k1 + 2 * k2 + 2 * k3 + k4) / 6
    return [tn[1], tn[2]]
end

end # module Domaca03
