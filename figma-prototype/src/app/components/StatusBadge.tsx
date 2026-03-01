import React from 'react';

interface StatusBadgeProps {
  status: 'healthy' | 'warning' | 'alert';
  size?: 'sm' | 'md' | 'lg';
}

export function StatusBadge({ status, size = 'md' }: StatusBadgeProps) {
  const statusConfig = {
    healthy: {
      label: 'Healthy',
      bgColor: 'bg-emerald-100',
      textColor: 'text-emerald-700',
      dotColor: 'bg-emerald-500',
    },
    warning: {
      label: 'Warning',
      bgColor: 'bg-amber-100',
      textColor: 'text-amber-700',
      dotColor: 'bg-amber-500',
    },
    alert: {
      label: 'Alert',
      bgColor: 'bg-red-100',
      textColor: 'text-red-700',
      dotColor: 'bg-red-500',
    },
  };

  const sizeStyles = {
    sm: 'px-2 py-1 text-xs',
    md: 'px-3 py-1.5 text-sm',
    lg: 'px-4 py-2 text-base',
  };

  const config = statusConfig[status];

  return (
    <div className={`inline-flex items-center gap-1.5 rounded-full ${config.bgColor} ${config.textColor} ${sizeStyles[size]}`}>
      <div className={`w-2 h-2 rounded-full ${config.dotColor} animate-pulse`}></div>
      <span>{config.label}</span>
    </div>
  );
}
