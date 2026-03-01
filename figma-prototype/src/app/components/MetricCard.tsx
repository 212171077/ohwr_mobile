import React from 'react';

interface MetricCardProps {
  label: string;
  value: string;
  unit?: string;
  trend?: {
    value: number;
    isPositive: boolean;
  };
  icon?: React.ReactNode;
  variant?: 'default' | 'success' | 'warning';
}

export function MetricCard({ label, value, unit, trend, icon, variant = 'default' }: MetricCardProps) {
  const variantStyles = {
    default: 'bg-white border-slate-200',
    success: 'bg-gradient-to-br from-emerald-50 to-white border-emerald-200',
    warning: 'bg-gradient-to-br from-amber-50 to-white border-amber-200',
  };

  return (
    <div className={`rounded-2xl border p-4 ${variantStyles[variant]}`}>
      <div className="flex items-start justify-between mb-3">
        <span className="text-sm text-slate-600">{label}</span>
        {icon && <div className="text-slate-500">{icon}</div>}
      </div>
      <div className="flex items-baseline gap-1 mb-1">
        <span className="text-3xl text-slate-900">{value}</span>
        {unit && <span className="text-lg text-slate-500">{unit}</span>}
      </div>
      {trend && (
        <div className={`flex items-center gap-1 text-sm ${trend.isPositive ? 'text-emerald-600' : 'text-red-600'}`}>
          <span>{trend.isPositive ? '↑' : '↓'}</span>
          <span>{Math.abs(trend.value)}%</span>
          <span className="text-slate-500 ml-1">vs last period</span>
        </div>
      )}
    </div>
  );
}
