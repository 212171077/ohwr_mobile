import React from 'react';
import { Sun, DollarSign, Activity, TrendingUp, Sparkles, Shield, Zap, Brain, Target, CheckCircle2, Battery } from 'lucide-react';
import { MetricCard } from '@/app/components/MetricCard';
import { StatusBadge } from '@/app/components/StatusBadge';
import { LineChart, Line, XAxis, YAxis, Tooltip, ResponsiveContainer, CartesianGrid, Area, AreaChart } from 'recharts';

const productionData = [
  { time: '6AM', kWh: 2.1, expected: 1.9 },
  { time: '8AM', kWh: 8.4, expected: 7.8 },
  { time: '10AM', kWh: 18.6, expected: 17.2 },
  { time: '12PM', kWh: 24.3, expected: 23.1 },
  { time: '2PM', kWh: 22.8, expected: 22.4 },
  { time: '4PM', kWh: 14.2, expected: 13.8 },
  { time: '6PM', kWh: 5.1, expected: 5.3 },
];

export function DashboardScreen() {
  return (
    <div className="flex flex-col gap-6 pb-6">
      {/* Hero Header with Value Proposition */}
      <div className="bg-gradient-to-br from-slate-900 via-blue-900 to-slate-900 text-white p-6 rounded-b-3xl relative overflow-hidden">
        {/* Background Pattern */}
        <div className="absolute inset-0 opacity-10">
          <div className="absolute top-10 right-10 w-32 h-32 border border-white rounded-full"></div>
          <div className="absolute bottom-10 left-10 w-24 h-24 border border-white rounded-full"></div>
        </div>
        
        <div className="relative z-10">
          <div className="flex items-start justify-between mb-4">
            <div>
              <div className="flex items-center gap-2 mb-2">
                <Brain className="w-5 h-5 text-emerald-400" />
                <span className="text-xs text-emerald-400 uppercase tracking-wider">AI-Powered Intelligence</span>
              </div>
              <h1 className="text-2xl mb-1">System Overview</h1>
              <p className="text-slate-300 text-sm">Pretoria, Gauteng • 8.4kW System</p>
            </div>
            <Sun className="w-10 h-10 text-amber-400" />
          </div>
          
          {/* Optimization Status Banner */}
          <div className="bg-emerald-500/20 border border-emerald-400/30 rounded-xl p-3 backdrop-blur-sm">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-2">
                <CheckCircle2 className="w-5 h-5 text-emerald-400" />
                <div>
                  <div className="text-emerald-400 text-xs mb-0.5">Optimization Active</div>
                  <div className="text-white text-sm">Balanced Mode • Savings Optimized</div>
                </div>
              </div>
              <StatusBadge status="healthy" size="sm" />
            </div>
          </div>
        </div>
      </div>

      <div className="px-4 flex flex-col gap-5">
        {/* AI Insight Card - Most Prominent */}
        <div className="bg-gradient-to-br from-blue-600 to-blue-700 rounded-2xl p-5 text-white shadow-lg">
          <div className="flex items-start gap-3 mb-3">
            <div className="w-10 h-10 bg-white/20 rounded-xl flex items-center justify-center flex-shrink-0">
              <Brain className="w-5 h-5" />
            </div>
            <div className="flex-1">
              <h3 className="text-lg mb-1">Today's AI Insight</h3>
              <p className="text-blue-50 text-sm leading-relaxed">
                Battery charge limited to 85% based on low solar forecast tomorrow — preserving battery cycles
              </p>
            </div>
          </div>
          <div className="grid grid-cols-2 gap-3 pt-3 border-t border-white/20">
            <div>
              <div className="text-blue-200 text-xs mb-0.5">Estimated Savings</div>
              <div className="text-lg">+R12</div>
            </div>
            <div>
              <div className="text-blue-200 text-xs mb-0.5">Cycles Preserved</div>
              <div className="text-lg">+8 cycles</div>
            </div>
          </div>
        </div>

        {/* Key Metrics with Intelligence Context */}
        <div>
          <div className="flex items-center justify-between mb-3">
            <h3 className="text-slate-900">Real-Time Performance</h3>
            <div className="flex items-center gap-1 text-xs text-slate-500">
              <div className="w-2 h-2 bg-emerald-500 rounded-full animate-pulse"></div>
              <span>Live</span>
            </div>
          </div>
          
          <div className="grid grid-cols-2 gap-4">
            <MetricCard
              label="Solar Production"
              value="34.6"
              unit="kWh"
              trend={{ value: 8.2, isPositive: true }}
              icon={<Sun className="w-5 h-5 text-amber-500" />}
              variant="success"
            />
            <MetricCard
              label="Cost Savings"
              value="R8.40"
              trend={{ value: 12.5, isPositive: true }}
              icon={<DollarSign className="w-5 h-5 text-emerald-500" />}
            />
            <MetricCard
              label="System Health"
              value="96"
              unit="%"
              icon={<Activity className="w-5 h-5 text-blue-500" />}
            />
            <MetricCard
              label="AI Accuracy"
              value="94.2"
              unit="%"
              icon={<Brain className="w-5 h-5 text-purple-500" />}
            />
          </div>
        </div>

        {/* Intelligence Story: Production Chart */}
        <div className="bg-white rounded-2xl border border-slate-200 p-5 shadow-sm">
          <div className="flex items-center justify-between mb-1">
            <h3 className="text-slate-900">Performance vs AI Prediction</h3>
            <div className="flex items-center gap-1.5 px-2 py-1 bg-blue-50 text-blue-700 rounded-lg text-xs">
              <Brain className="w-3 h-3" />
              <span>ML Model</span>
            </div>
          </div>
          <p className="text-sm text-slate-500 mb-4">Real-time comparison to intelligent forecasts</p>
          <ResponsiveContainer width="100%" height={220}>
            <AreaChart data={productionData}>
              <defs>
                <linearGradient id="colorActual" x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor="#10B981" stopOpacity={0.3}/>
                  <stop offset="95%" stopColor="#10B981" stopOpacity={0}/>
                </linearGradient>
              </defs>
              <CartesianGrid strokeDasharray="3 3" stroke="#E2E8F0" />
              <XAxis 
                dataKey="time" 
                tick={{ fontSize: 12, fill: '#64748B' }}
                tickLine={false}
                axisLine={{ stroke: '#E2E8F0' }}
              />
              <YAxis 
                tick={{ fontSize: 12, fill: '#64748B' }}
                tickLine={false}
                axisLine={{ stroke: '#E2E8F0' }}
                label={{ value: 'kWh', angle: -90, position: 'insideLeft', style: { fontSize: 12, fill: '#64748B' } }}
              />
              <Tooltip 
                contentStyle={{ 
                  backgroundColor: '#1E293B', 
                  border: 'none', 
                  borderRadius: '8px',
                  color: '#fff'
                }}
              />
              <Area 
                type="monotone" 
                dataKey="expected" 
                stroke="#94A3B8" 
                strokeWidth={2}
                fill="none"
                strokeDasharray="5 5"
                name="AI Predicted"
              />
              <Area 
                type="monotone" 
                dataKey="kWh" 
                stroke="#10B981" 
                strokeWidth={3}
                fill="url(#colorActual)"
                name="Actual"
              />
            </AreaChart>
          </ResponsiveContainer>
          <div className="flex items-center gap-4 mt-3 text-xs">
            <div className="flex items-center gap-2">
              <div className="w-3 h-0.5 bg-emerald-500"></div>
              <span className="text-slate-600">Actual Performance</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-3 h-0.5 bg-slate-400 border-dashed"></div>
              <span className="text-slate-600">AI Prediction</span>
            </div>
          </div>
          <div className="mt-3 p-3 bg-emerald-50 rounded-lg">
            <p className="text-xs text-emerald-800">
              <span className="font-medium">↑ 8.2% above prediction</span> — System exceeding AI forecast, generating R0.68 extra revenue
            </p>
          </div>
        </div>

        {/* Optimization Impact This Month */}
        <div className="bg-gradient-to-br from-slate-50 to-emerald-50 rounded-2xl border border-emerald-200 p-5">
          <div className="flex items-center gap-2 mb-4">
            <Target className="w-5 h-5 text-emerald-600" />
            <h3 className="text-slate-900">Optimization Impact (January)</h3>
          </div>
          <div className="space-y-4">
            <div className="flex items-start gap-3">
              <div className="w-8 h-8 rounded-lg bg-emerald-100 flex items-center justify-center flex-shrink-0">
                <DollarSign className="w-4 h-4 text-emerald-600" />
              </div>
              <div className="flex-1">
                <div className="flex items-center justify-between mb-1">
                  <span className="text-sm text-slate-900">Additional Revenue</span>
                  <span className="text-emerald-600 font-medium">+R342</span>
                </div>
                <p className="text-xs text-slate-600">AI-driven optimizations increased output by 17.9%</p>
              </div>
            </div>
            
            <div className="flex items-start gap-3">
              <div className="w-8 h-8 rounded-lg bg-purple-100 flex items-center justify-center flex-shrink-0">
                <Battery className="w-4 h-4 text-purple-600" />
              </div>
              <div className="flex-1">
                <div className="flex items-center justify-between mb-1">
                  <span className="text-sm text-slate-900">Battery Cycles Saved</span>
                  <span className="text-purple-600 font-medium">+420</span>
                </div>
                <p className="text-xs text-slate-600">Intelligent charge management extending battery lifespan</p>
              </div>
            </div>

            <div className="flex items-start gap-3">
              <div className="w-8 h-8 rounded-lg bg-blue-100 flex items-center justify-center flex-shrink-0">
                <Shield className="w-4 h-4 text-blue-600" />
              </div>
              <div className="flex-1">
                <div className="flex items-center justify-between mb-1">
                  <span className="text-sm text-slate-900">Anomalies Detected</span>
                  <span className="text-blue-600 font-medium">3 issues</span>
                </div>
                <p className="text-xs text-slate-600">Early detection prevented R1,240 in potential damage</p>
              </div>
            </div>
          </div>
        </div>

        {/* Monthly Performance Summary */}
        <div className="bg-white rounded-2xl border border-slate-200 p-5">
          <h3 className="text-slate-900 mb-4">January Performance Summary</h3>
          <div className="space-y-3">
            <div className="flex items-center justify-between pb-3 border-b border-slate-100">
              <span className="text-sm text-slate-600">Total Production</span>
              <div className="text-right">
                <div className="text-slate-900">876 kWh</div>
                <div className="flex items-center gap-1 text-emerald-600 text-xs">
                  <TrendingUp className="w-3 h-3" />
                  <span>14.2% vs last month</span>
                </div>
              </div>
            </div>
            <div className="flex items-center justify-between pb-3 border-b border-slate-100">
              <span className="text-sm text-slate-600">Revenue Generated</span>
              <div className="text-right">
                <div className="text-slate-900">R212.80</div>
                <div className="flex items-center gap-1 text-emerald-600 text-xs">
                  <TrendingUp className="w-3 h-3" />
                  <span>16.8% vs last month</span>
                </div>
              </div>
            </div>
            <div className="flex items-center justify-between pb-3 border-b border-slate-100">
              <span className="text-sm text-slate-600">AI Prediction Accuracy</span>
              <div className="text-right">
                <div className="text-slate-900">94.2%</div>
                <div className="text-xs text-slate-500">+2.1% improvement</div>
              </div>
            </div>
            <div className="flex items-center justify-between">
              <span className="text-sm text-slate-600">System Uptime</span>
              <div className="text-right">
                <div className="text-slate-900">99.8%</div>
                <div className="text-xs text-emerald-600">Industry leading</div>
              </div>
            </div>
          </div>
        </div>

        {/* Lifetime Value Projection */}
        <div className="bg-gradient-to-br from-slate-900 to-blue-900 rounded-2xl p-5 text-white">
          <div className="flex items-center gap-2 mb-3">
            <Sparkles className="w-5 h-5 text-emerald-400" />
            <h3 className="text-lg">Projected Lifetime Value</h3>
          </div>
          <div className="flex items-baseline gap-2 mb-2">
            <span className="text-4xl">R109,800</span>
          </div>
          <p className="text-slate-300 text-sm mb-4">
            25-year savings with Ohwr intelligence vs. standard monitoring
          </p>
          <div className="grid grid-cols-2 gap-3 pt-4 border-t border-white/20">
            <div>
              <div className="text-slate-300 text-xs mb-1">Extra Revenue</div>
              <div className="text-lg">+R22,400</div>
            </div>
            <div>
              <div className="text-slate-300 text-xs mb-1">Avoided Repairs</div>
              <div className="text-lg">R18,200</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}