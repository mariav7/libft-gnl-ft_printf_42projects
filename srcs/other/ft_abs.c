/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_abs.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mflores- <mflores-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/01 09:46:29 by mflores-          #+#    #+#             */
/*   Updated: 2023/04/01 09:48:47 by mflores-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

/*
	Returns the absolute value
*/

int		ft_abs(int nb)
{
    long long int nbr;

    nbr = nb;    
	if (nbr < 0)
		return (nbr = nbr * -1);
	else
		return (nbr);
}
